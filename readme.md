# CodeQL-javascript

## [CodeQL analysis](codeql-ts.dockerfile:L13-15)

```shell
git clone https://github.com/qljcherry/codeql-typescript-ignore .
docker build -f codeql-ts.dockerfile .
```

Results are found in both src and tests directories.

```text
"Code injection","Interpreting unsanitized user input as code allows a malicious user arbitrary code execution.","error","[[""User-provided value""|""relative:///src/foo.ts:1:6:1:27""]] flows to here and is interpreted as code.","/src/foo.ts","1","6","1","85"
"Code injection","Interpreting unsanitized user input as code allows a malicious user arbitrary code execution.","error","[[""User-provided value""|""relative:///tests/foo.ts:1:6:1:27""]] flows to here and is interpreted as code.","/tests/foo.ts","1","6","1","85"
```

## [CodeQL analysis with config file](codeql-ts-ignore.dockerfile:L13-15)

```shell
git clone https://github.com/qljcherry/codeql-typescript-ignore .
docker build -f codeql-ts-ignore.dockerfile .
```

Results are only found in the [ignored paths](.codeql.yaml#L2).

```text
"Code injection","Interpreting unsanitized user input as code allows a malicious user arbitrary code execution.","error","[[""User-provided value""|""relative:///tests/foo.ts:1:6:1:27""]] flows to here and is interpreted as code.","/tests/foo.ts","1","6","1","85"
```
