# basic template for an android java app

## building in nixos

enter dev shell (note that this installes `android-studio`)
```
nix develop
```

build
```
./gradlew build
```

### fixing "Could not start dynamically linked executable"
- on my system im getting this for this for `~/.gradle/caches/8.10.2/transforms/8f58f16f3d7bcbb7e08d726f1920e0bc/transformed/aapt2-8.1.1-10154469-linux/aapt2`

and im able to fix the error with
```
patchelf --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
    ~/.gradle/caches/8.10.2/transforms/8f58f16f3d7bcbb7e08d726f1920e0bc/transformed/aapt2-8.1.1-10154469-linux/aapt2
```

and build again 
```
./gradlew build
```

if build is successfull APKs should be in `app/build/outputs/apk/`

- you could use android studio for an emulator
