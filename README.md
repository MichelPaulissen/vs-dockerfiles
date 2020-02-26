(This is forked from https://github.com/microsoft/vs-dockerfiles and modified to only have the necessary files for vs2019 buildtools, the readme and license texts are otherwise unmodified)

# Samples
You can install Visual Studio Build Tools [into a container](https://docs.microsoft.com/en-us/visualstudio/install/build-tools-container) to support a consistent, isolated build environment. This repository hosts a number of examples - and is accepting [contributions](CONTRIBUTING.md) for more, useful examples - you can use to build a container image using Build Tools tailored to your project types and build pipeline. Because these container images can be massive - larger than probably anyone needs - and the permutations of different Windows, Visual Studio, and .NET Framework versions would complicate which version you might need, you are encouraged to use these samples or build on them and publish, if desired, images to your own Docker registry on your LAN or WAN.

Note that Visual Studio Build Tools is licensed as a [supplemental license](https://www.visualstudio.com/license-terms/mlt553512/) for Visual Studio. Images may only be pushed to repositories to provide pull access to users with a valid Visual Studio license.

* [.NET Framework + native desktop](managed-native-desktop/README.md)
* [Native desktop](native-desktop/README.md)

## Contributing
To contribute your own sample Dockerfiles and optional support scripts, please see [CONTRIBUTING](CONTRIBUTING.md).

## License
This project and all examples herein are licensed under the [MIT license](LICENSE.txt). Visual Studio Build Tools is licensed as [supplemental license](https://www.visualstudio.com/license-terms/mlt553512/) for Visual Studio.
