

## Del 2 - CI

### Oppgave 3
for å kunne sette opp branch protection må du være admin på repoet.
så må du gå inn /settings og så til branchs på venstre side. 
der kan du velge main branchen, også kan du velge add branch protection rule.
![oppgave2.3.1.png](img/oppgave2.3.1.png)

så må du skrive inn i branch name pattern: main
![img.png](img/oppgave2.3.2.png)

så kan du velge disse reglene
- Require a pull request before merging
  - Require approvals before merging
    - Number of required approvals: 1
  - Dismiss stale pull request approvals when new commits are pushed
  - Require approval of the most recent push
- Require status checks to pass before merging
  - Require branches to be up to date before merging
  - need to add status checks
    - add status check: build
    - add status check: terraform
    - add status check: docker
- Do not allow bypassing the above settings
![img_2.png](img/oppgave2.3.3.png)

så kan du trykke save changes og da vil du ha branch protection på main branchen.


## Del 3 - Docker
### Oppgave 1
for at docker pipelinen skal kjøre må disse punktene være gjort.
- docker hub userName og password må ligge i github secrets på repoet.
- må bruke riktig jdk version i docker filen som pom.xml burker ex. "adoptopenjdk/openjdk11"
- må ha 2 steg for at docker/build-push-action@v3 skal fungere. [ref](https://github.com/docker/build-push-action#path-context)
  - docker/setup-qemu-action@v2 
  - docker/setup-buildx-action@v2

### Oppgave 3
Får å få docker image til å publishe til din egen ECR må du ha AWS_ACCESS_KEY_ID og AWS_SECRET_ACCESS_KEY i github secrets.
du må også ender env verdien "ECR_REGISTRY_NAME" i pipelinen til din egen ECR registry name.
så vil den publish til din egen ECR med sha tag og latest tag.


## Del 5
### Oppgave 1
Hoved problemet er at state filene som terraform lager blir ikke lagret på et felles sted, 
som vil si at når den kjører første gang går det helt fint.
Men de andre gangene så vet ikke terraform at den lagde en ressurs i AWS,
så den vil prøve å lage den samme ressursen igjen, men feile fordi en S3 bucket må ha unikt navn og er ikke stareless.
Så for å løse dette problemet må vi sette opp en felles s3 bucket som terraform kan lagre state filene sine i.
Det gjør man ved å legge til det i porvider.tf filen.
Da vil du ikke få feil når du kjører terraform apply flere ganger.
```terraform
terraform {
  backend "s3" {
    bucket = "pgr301-2021-terraform-state"
    key    = "<name>/terraform.state"
    region = "eu-north-1"
  }
}
```