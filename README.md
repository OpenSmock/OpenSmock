[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 13](https://img.shields.io/badge/Pharo-13-%23aac9ff.svg)](https://pharo.org/download)

[![License](https://img.shields.io/github/license/OpenSmock/OpenSmock.svg)](./LICENSE)
[![Unit tests](https://github.com/OpenSmock/OpenSmock/actions/workflows/CI.yml/badge.svg)](https://github.com/OpenSmock/OpenSmock/actions/workflows/CI.yml)

# OpenSmock

OpenSmock is a collection of tools and workshops designed to streamline the development of applications - especially user interfaces (UI) - within the Pharo programming environment.

## Getting Started

### Full version installation

To install **OpenSmock** with all features and dependencies, simply execute the following script in your Pharo image:

```smalltalk
Metacello new
   baseline: 'OpenSmock';
   repository: 'github://OpenSmock/OpenSmock:main/src';
   load.
```

### Minimal version (Core) installation

If you prefer to install only the core version of OpenSmock (without additional dependencies), use the following script:

```smalltalk
Metacello new
   baseline: 'OpenSmock';
   repository: 'github://OpenSmock/OpenSmock:main/src';
   load: 'Core'.
```

### Minimal version (Core) with Bloc features installation

If you prefer to install only the core version of OpenSmock (without additional dependencies but with Bloc features), use the following script:

```smalltalk
Metacello new
   baseline: 'OpenSmock';
   repository: 'github://OpenSmock/OpenSmock:main/src';
   load: 'CoreWithBloc'.
```

Note: This version is also similar to a Core version when Pharo will integrate Bloc.

### Dependencies

Core : 

- No dependencies

Default/Full :

- [Molecule](https://github.com/OpenSmock/Molecule)
- [Alexandrie](https://github.com/pharo-graphics/alexandrie)
- [Bloc](https://github.com/pharo-graphics/bloc)

Note: Bloc and Alexandrie will soon be integrated into Pharo, at which point this dependency will be removed.

## Credits

* **Pierre Laborde** - *Initial work* - [labordep](https://github.com/labordep)
* **Eric Le Pors** - *Initial work* - [ELePors](https://github.com/ELePors)
* **Brendan Landais** - *Development* - [LANDAISB](https://github.com/LANDAISB)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
