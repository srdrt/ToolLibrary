# Sample PrimeApps Project (.NET Core)

This sample demonstrates how to develop a PrimeApps project using .NET Core 2.2.

## Local Setup

Before running this sample locally, you need to install PostgreSQL, Redis and Minio. Please follow [installation guide](https://). Then follow the steps below.

1. Clone this repository
2. Run `database` command
3. Clone [PrimeApps Runtime Environment (PRE)](https://github.com/primeapps-io/pre)
4. Copy startup folder
5. Run `run` command

### 1. Clone this repository
```bash
git clone https://github.com/primeapps-io/sample-dotnet.git
```

Enter folder:
```bash
cd sample-dotnet
```

### 2. Run `database` command
Run the following command to create databases to your local PostgreSQL server in database folder

Enter database folder:
```bash
cd database
```

Create databases:
```bash
./database -c
```

### 3. Clone PrimeApps Runtime Environment (PRE)
```bash
git clone https://github.com/primeapps-io/pre.git
```
Enter folder:
```bash
cd pre
```

### 4. Copy startup folder
Copy startup folder to sample-dotnet root

```bash
cp startup /sample-dotnet
```

### 5. Run `run` command
Enter startup folder:
```bash
cd startup
```

Start runtime:
```bash
./run
```