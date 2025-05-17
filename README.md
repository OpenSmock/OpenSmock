[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 13](https://img.shields.io/badge/Pharo-13-%23aac9ff.svg)](https://pharo.org/download)

[![License](https://img.shields.io/github/license/OpenSmock/OpenSmock.svg)](./LICENSE)
[![Unit tests](https://github.com/OpenSmock/OpenSmock/actions/workflows/CI.yml/badge.svg)](https://github.com/OpenSmock/OpenSmock/actions/workflows/CI.yml)

# OpenSmock

Workshops and tools for developing applications, particularly user interfaces (UI), in Pharo.

## Getting Started

### Installing OpenSmock

To install all OpenSmock workshop on your Pharo image you can just execute the following script:

```smalltalk
Metacello new
   baseline: 'OpenSmock';
   repository: 'github://OpenSmock/OpenSmock:main/src';
   load.
```

To install only OpenSmock core packages (no major dependencies) on your Pharo image you can just execute the following script:

```smalltalk
Metacello new
   baseline: 'OpenSmock';
   repository: 'github://OpenSmock/OpenSmock:main/src';
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
