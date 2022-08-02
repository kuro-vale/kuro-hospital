# Kuro-hospital

[![Lint](https://github.com/kuro-vale/kuro-hospital/actions/workflows/lint.yml/badge.svg)](https://github.com/kuro-vale/kuro-hospital/actions/workflows/lint.yml)
[![Tests](https://github.com/kuro-vale/kuro-hospital/actions/workflows/tests.yml/badge.svg)](https://github.com/kuro-vale/kuro-hospital/actions/workflows/tests.yml)

Welcome to my GraphQL API made with ruby on rails, here you can create doctors, patients, drugs and consultations for the patients.

I made this API for learning purposes only, the information shown is completely false.

This is a stateful API, your session will be stored in cookies, the model for authentication are doctors, so you have to create a doctor to login.

Some of the features are queries, mutations, session with JWT and pagination

Test this [API](https://kuro-hospital.herokuapp.com/graphql) or in the GraphiQL [Playground](https://kuro-hospital.herokuapp.com/graphiql)

See the [DOCS](https://documenter.getpostman.com/view/20195671/Uze1x5Ag) in postman or

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/20195671-37109012-5adb-47ab-9cca-41ef94ec91ee?action=collection%2Ffork&collection-url=entityId%3D20195671-37109012-5adb-47ab-9cca-41ef94ec91ee%26entityType%3Dcollection%26workspaceId%3D340d12f8-bfd8-4f84-8bc7-f3b080c24682)

## Quick setup

1. ```git clone https://github.com/kuro-vale/kuro-hospital.git```
2. Set environment variables
 - DEV_DATABASE_URL="mysql2://username:password@host:port/dev-database"
 - TEST_DATABASE_URL="mysql2://username:password@host:port/test-database"
 - PROD_DATABASE_URL="mysql2://username:password@host:port/prod-database"
 - HMAC_SECRET="JWT_SECRET"

3. Run ```bundle install```
4. Migrate database ```bin/rails db:migrate```
4. Run ```bin/rails server```

## Developer container

Alternatively you can test this project in a dev container for vscode

1. ```git clone https://github.com/kuro-vale/kuro-wiki.git```
2. Change environment variables in Dockerfile with your databases
3. Reopen directory in dev container using Dockerfile
4. Run ```bin/rails server```
