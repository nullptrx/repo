# nexus maven repo

## 同步仓库

```
dart run sync.dart
```

## 引用仓库

```groovy
rootProject.allprojects {
    repositories {
        google()
        mavenCentral()
        // maven { url 'http://localhost:8081/repository/m2/' }
        // maven { url 'https://raw.githubusercontent.com/nullptrX/repo/master/m2' }
        maven { url 'https://cdn.jsdelivr.net/gh/nullptrX/repo/m2/' }
    }
}

dependencies {
    api 'io.github.nullptrx:$artifact:$version@aar'
}
```

