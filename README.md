# TaskManager App

Application de gestion de tâches multi-services conteneurisée avec **Docker Compose**, comprenant un backend **Spring Boot**, une base de données **MySQL** et un frontend **React (Vite / Nginx)**.

##  Architecture du Projet

* **Backend :** Spring Boot (Port interne : `8091`) avec documentation Swagger UI.
* **Frontend :** React avec Vite, servi via Nginx (Port hôte : `7080`).
* **Base de données :** MySQL 8 (Port interne : `3306`).

---

##  Prérequis

Assurez-vous d'avoir installé les outils suivants sur votre machine :
* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)

---

##  Installation et Lancement Local

1. **Cloner le dépôt :**
```bash   
   git clone [https://github.com/thier32/taskmanager-deploy.git](https://github.com/thier32/taskmanager-deploy.git)

   cd taskmanager-deploy
```

2. **Lancer les conteneurs avec Docker Compose :**
```bash
docker-compose up -d --build

```

3. **Vérifier l'état des conteneurs :**
```bash
docker ps

```

## Accès aux Services

Une fois les conteneurs lancés, vous pouvez accéder aux différentes interfaces :

* **Frontend (Application Web) :** [http://127.0.0.1:7080](http://localhost:7080)
* **Backend API / Swagger UI :** [http://127.0.0.1:6001/swagger-ui.html](https://www.google.com/search?q=http://127.0.0.1:6001/swagger-ui.html&utm_source=gemini) *(utilisez `127.0.0.1` plutôt que `localhost` si vous rencontrez des problèmes de résolution IPv6)*

---

##  Commandes Utiles

* **Arrêter les services :**
```bash
docker-compose down
```

* **Consulter les logs (en cas de problème) :**
```bash
docker-compose logs -f
```

* **Reconstruire totalement un service (ex: le frontend après modification de l'URL API) :**
```bash
docker-compose build --no-cache frontend
docker-compose up -d
```

