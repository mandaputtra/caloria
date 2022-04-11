# Caloria Alpha

Toy flutter project that to answer my question, "Is flutter good?". But what the purpose of this app really? The purpose is it can track your diet calorie per day ~ it it named Caloria. How to use it? 

Please see this video:

## Develop

Just like another flutter app - nothing special.

## Is this project can be serious?

Probably, this is actualy one of my idea on my backlog. If this can be serious side project. Maybe the next step are:

- [ ] Refactor to use NX.dev
- [ ] Write test
- [ ] Setup a CI to run test
- [ ] Using media query for web
- [ ] Setup a CD to build apk and provide a github release
- [ ] Buy iPhone for testing purpose
- [ ] Update UI to be more joyfull
- [ ] Sync feature per device

## What is like using flutter for this project?

This is my first mobile app. Flutter and Dart is nice. 

Flutter itself are something like web ecosystem, let me elaborate. Most of flutter widget are composed from another widget, kinda like HTML every element had it's own `addEventListener` and other stuff. So most likely you can see all of the widget implementation by just going to the definition. This is why Flutter are powerfull for creating the UI

It's easy to understand on how to compose thing, but the OOP concept can be a bit too much. You can look on my code, I used to code imperatively ~ I left OOP behind 3 years ago when using PHP/Laravel. So learning it again kinda confuse me. Especially when someone on twitter started to point me with BLoC, that are so repetitive.

Dart is like python, it has many standard library. I also in love with this `..` (double dot) [operator](https://dart.dev/guides/language/language-tour#cascade-notation), feels hacky.

Overall, it is complete and fun. Having one source to develop many platform apps are always great. I haven't look at other topic like performance, how to update flutter app without releasing an APK (i forgot what they call it), and many intermediate to advanced topics - since this are just shitty app.

## Credits

- [fatsecret](https://www.fatsecret.co.id/) for providing raw calories data
- [unofc api of fatsecret](https://fatsecret-unofc-api.vercel.app/)
- All the libs used here

