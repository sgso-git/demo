FROM soongilso/jdk:17.0.15-alpine

RUN mkdir -p /app/deploy
RUN mkdir -p /app/log

ENV APP_HOME=/app/deploy

RUN addgroup -g 1001 app && adduser -u 1002 -G app -D demo-app
RUN chown -R 1002:1001 /app

WORKDIR ${APP_HOME}

USER 1002

#COPY --chown=1002:1001 ./*.war ${APP_HOME}/app.war

EXPOSE 8081

CMD ["java", "-jar", "app.war"]