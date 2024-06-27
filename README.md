[![License](https://img.shields.io/github/license/OpenSmock/OpenSmock.svg)](./LICENSE)
[![Pharo 11 CI](https://github.com/OpenSmock/OpenSmock/actions/workflows/Pharo11CI.yml/badge.svg)](https://github.com/OpenSmock/OpenSmock/actions/workflows/Pharo11CI.yml)
[![Pharo 12 CI](https://github.com/OpenSmock/OpenSmock/actions/workflows/Pharo12CI.yml/badge.svg)](https://github.com/OpenSmock/OpenSmock/actions/workflows/Pharo12CI.yml)
[![Pharo 13 CI](https://github.com/OpenSmock/OpenSmock/actions/workflows/Pharo13CI.yml/badge.svg)](https://github.com/OpenSmock/OpenSmock/actions/workflows/Pharo13CI.yml)

# OpenSmock

Workshops and tools for developing applications, particularly user interfaces (UI), in Pharo.

## Getting Started

### Installing OpenSmock

To install all OpenSmock workshop on your Pharo image you can just execute the following script:

```smalltalk
Metacello new
   baseline: 'OpenSmock';
   repository: 'github://OpenSmock/OpenSmock';
   load.
```

To install only OpenSmock core packages (no major dependencies) on your Pharo image you can just execute the following script:

```smalltalk
Metacello new
   baseline: 'OpenSmock';
   repository: 'github://OpenSmock/OpenSmock';
   load: 'Core'.
```

### Dependencies

- [Molecule](https://github.com/OpenSmock/Molecule)
- [Bloc](https://github.com/pharo-graphics/bloc)

## Credits

* **Pierre Laborde** - *Initial work* - [labordep](https://github.com/labordep)
* **Eric Le Pors** - *Initial work* - [ELePors](https://github.com/ELePors)
* **Brendan Landais** - *Development* - [LANDAISB](https://github.com/LANDAISB)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
