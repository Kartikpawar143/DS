# CORBA String Reversal Demo

## Requirements
- Java 8 (OpenJDK 8) - CORBA was removed in Java 9+
- Make sure `java`, `javac`, `idlj`, and `orbd` are in your PATH

## Installation (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install openjdk-8-jdk
```

## Installation (CentOS/RHEL)
```bash
sudo yum install java-1.8.0-openjdk-devel
```

## Run
```bash
chmod +x setup_and_run.sh
./setup_and_run.sh
```

The script will automatically check for Java 8 and exit with an error message if not found.
