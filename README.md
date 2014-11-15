# Simple standalone example using ActibeJDBC
(no Ant or Maven)

This branch was created to show the issue we are having with dynamic instrumentation and Java 8.
Steps to reproduce the issue:

## Prepare your environment:

1. Configure Java 8 in your environment.
2. Execute create.sql against your DB - this will create a table.
3. Adjust database connection parameters in `src/activejdbc/examples/simple/SimpleExample.java`, line 11.

## Execute project with static instrumentation

*  Execute script `run-static-instrumentation.sh`, and see that everything is fine

## Execute project with dynamic instrumentation

*  Execute script `run-dymanic-instrumentation.sh`, and see that you are getting an exception below:

```
    ./run-dynamic-instrumentation.sh
    [main] INFO activejdbc.examples.simple.SimpleExample - =========> Created employee:
    [main] INFO activejdbc.examples.simple.SimpleExample - Model: activejdbc.examples.simple.Employee, table: 'employees', attributes: {last_name=Doe, id=54, first_name=John}
    [main] INFO activejdbc.examples.simple.SimpleExample - =========> Updated employee:
    Java8 start>>>
    Exception in thread "main" java.lang.BootstrapMethodError: java.lang.NoClassDefFoundError: Could not initialize class java.lang.invoke.CallSite
        at activejdbc.examples.simple.SimpleExample.selectAllEmployees(SimpleExample.java:60)
        at activejdbc.examples.simple.SimpleExample.main(SimpleExample.java:18)
    Caused by: java.lang.NoClassDefFoundError: Could not initialize class java.lang.invoke.CallSite
        at java.lang.invoke.MethodHandleNatives.linkCallSite(MethodHandleNatives.java:296)
        ... 2 more
```

## Execute project with dynamic instrumentation, but remove Java 8 feature

* Comment out line 60 from file `src/activejdbc/examples/simple/SimpleExample.java`.
* Execute script `run-dymanic-instrumentation.sh`, and see successful execution



