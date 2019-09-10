If you application is looking for a file like this:

```code
final InputStream resources = App.class.getClassLoader().getResourceAsStream("configuration.yaml");
```

The configuration.yaml file must be within the classpath.  So it needs to sit in src/main/resources, not in a folder elsewhere on the root of the application.
