# json-validator

A JSON lexer and parser written in JFLEX and CUP. This program takes an input and then checks if this input is a valid JSON object according to the official ECMA-404 JSON Data Interchange Standard (see json.org) specification.

## Contents
- [How to use](#how-to-use)

## How to use

| Command                         | Usage                                                                    |
|---------------------------------|--------------------------------------------------------------------------|
| `./gradlew jflex`               | Generate JFlex Java source code under `build/generated-src/jflex`.       |
| `./gradlew jcup`                | Generate Cup Java source code under `build/generated-src/jcup`.          |
| `./gradlew prepare`             | Run `jflex` and `jcup` together.                                         |
| `./gradlew build`               | Compile the generate source files.                                       |
