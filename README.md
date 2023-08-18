[![License](https://img.shields.io/github/license/OpenSmock/OpenSmock.svg)](./LICENSE)

# OpenSmock

Workshop and utilities to make applications, specialy user interfaces (UI), in Pharo.

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

## Credits

* **Pierre Laborde** - *Initial work* - [labordep](https://github.com/labordep)
* **Eric Le Pors** - *Initial work* - [ELePors](https://github.com/ELePors)
* **Brendan Landais** - *Development*

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
