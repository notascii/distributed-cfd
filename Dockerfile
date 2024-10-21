# Base image - Utiliser une image avec Python et MPI préinstallés
FROM ubuntu:22.04

# Mettre à jour les packages de base
RUN apt-get update && apt-get upgrade -y

# Installer les dépendances de développement
RUN apt-get install -y build-essential python3 python3-pip libopenmpi-dev openmpi-bin

# Installer les bibliothèques Python nécessaires (SciPy, NumPy, mpi4py, etc.)
RUN pip3 install --upgrade pip
RUN pip3 install numpy scipy matplotlib mpi4py



# Ajouter les fichiers source de l'application à l'image Docker
WORKDIR /app
COPY ./src /app



# Commande par défaut pour lancer l'application avec MPI
CMD ["mpirun", "--allow-run-as-root", "-np", "4", "python3", "navier_stokes_solver.py"]

