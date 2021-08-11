FROM altsgamerlab/keycloak-login-recaptcha:15.0.0

USER root

COPY . /project
RUN cd /project && chmod +x mvnw && ./mvnw clean install

FROM altsgamerlab/keycloak-login-recaptcha:15.0.0
USER root
COPY --from=0 /project/target/keycloak-to-rabbit.jar /opt/jboss/keycloak/standalone/deployments/keycloak-to-rabbit.jar

USER 1000