+--------------+        +--------------------------+        +-------------------------+
|  Logs Bruts  |  --->  |  Pipeline d'Ingestion    |  --->  |   Index Structuré       |
| (Raw Logs)   |        | (Grok, Date Processor,   |        |   (Structured Index)    |
+--------------+        |  Remove Fields, etc.)    |        +-------------------------+

### Pipeline d'Ingestion : Explication Simplifiée

Un pipeline dans OpenSearch est un processus qui transforme et enrichit les données avant de les indexer. Il prend les données brutes, les passe à travers plusieurs étapes (ou processeurs), et les prépare pour qu'elles soient exploitables.

**Fonctionnement :**
- **Capture des données** (ex: logs)
- **Passage par le pipeline** :
  - **Extraction** des informations clés (ex: IP, URL)
  - **Conversion** des formats (ex: texte en date)
  - **Renommage** ou **ajout** de champs utiles
- **Indexation finale** dans OpenSearch

**Avantages :**
- Améliore la **qualité des données**
- **Automatise** le traitement
- Assure une **flexibilité** pour répondre aux besoins spécifiques


PUT _ingest/pipeline/exemple_pipeline
{
  "description": "Pipeline d'exemple pour traitement des logs",
  "processors": [
    {
      "grok": {
        "field": "message",
        "patterns": ["%{TIMESTAMP_ISO8601:timestamp} %{WORD:loglevel} %{GREEDYDATA:message_content}"]
      }
    },
    {
      "rename": {
        "field": "message_content",
        "target_field": "log_message"
      }
    },
    {
      "date": {
        "field": "timestamp",
        "formats": ["yyyy-MM-dd HH:mm:ss"]
      }
    }
  ]
}

Diapositive 2: Navigation dans la Section Discover
Exploration des Données : La section Discover permet d'explorer et d'analyser vos données indexées en temps réel.
Fonctionnalités Clés :
Filtres : Affinez les résultats en appliquant des filtres sur les champs disponibles (ex. : durée, ID de tâche).
Visualisation : Observez les tendances avec des graphiques de séries temporelles, des histogrammes, etc.
Sauvegarde des Requêtes : Conservez vos recherches fréquentes pour un accès rapide.
Cas d'Usage :
Analyser la distribution des durées de tâches.
Filtrer les logs par ID de tâche pour isoler des événements spécifiques.


```markdown
### Confluence Documentation: Creating Index and Index Patterns in OpenSearch

---

**Objective:**  
This documentation is designed to help new users create indexes and index patterns in OpenSearch. It provides clear, step-by-step instructions, with placeholders for screenshots. By the end of this guide, you should be able to create an index and an index pattern on your own.

---

### Table of Contents

1. [Introduction to Index and Index Patterns](#introduction)
2. [Prerequisites](#prerequisites)
3. [Creating an Index in OpenSearch](#creating-index)
4. [Creating an Index Pattern](#creating-index-pattern)
5. [Troubleshooting Tips](#troubleshooting)
6. [Conclusion](#conclusion)

---Confluence Documentation: Creating Index and Index Patterns in OpenSearch
Objective:
This documentation is designed to help new users create indexes and index patterns in OpenSearch. It provides clear, step-by-step instructions, with placeholders for screenshots. By the end of this guide, you should be able to create an index and an index pattern on your own.

Table of Contents
Introduction to Index and Index Patterns
Prerequisites
Creating an Index in OpenSearch
Creating an Index Pattern
Troubleshooting Tips
Conclusion
1. Introduction to Index and Index Patterns
What is an Index?
An index is a collection of documents in OpenSearch that helps you store, search, and analyze data. Each document in an index is a JSON object.

What is an Index Pattern?
An index pattern in OpenSearch is a template that allows you to define how data should be indexed and searched. It connects the data stored in the index with the visualization tools in OpenSearch.

2. Prerequisites
Before you start, make sure you have:

Access to an OpenSearch instance.
Necessary permissions to create indexes and index patterns.
Basic understanding of JSON (optional but helpful).
3. Creating an Index in OpenSearch
Follow these steps to create an index in OpenSearch:

Step 1: Log into OpenSearch Dashboard

Go to your OpenSearch Dashboard URL.
Log in using your credentials.
Step 2: Access the Index Management Page

On the left-hand menu, click on "Index Management".
You will see a list of existing indexes.
Step 3: Create a New Index

Click on the "Create Index" button.
Enter a name for your index (e.g., my-index).
Configure any additional settings if needed (e.g., number of shards, replicas).
Step 4: Save the Index

Review your settings and click "Create".
Your index should now appear in the list of indexes.
4. Creating an Index Pattern
Once your index is created, follow these steps to create an index pattern:

Step 1: Access the Index Patterns Page

On the left-hand menu, click on "Stack Management" and then "Index Patterns".
Step 2: Create a New Index Pattern

Click on the "Create Index Pattern" button.
Enter the name of your index or use a wildcard (e.g., my-index-*).
Click "Next Step".
Step 3: Define Time Field (Optional)

If your index has a time field, select it from the dropdown menu. This is useful for time-based data (e.g., logs).
Click "Create Index Pattern" to save.
Step 4: Confirmation

You will be redirected to the index pattern details page. Your index pattern is now ready to use.
5. Troubleshooting Tips
Index Not Showing Up: Ensure that the index was created successfully and that the name is correct.
Permission Issues: Double-check your user permissions in OpenSearch.
Time Field Issues: Make sure the correct time field is selected if applicable.
6. Conclusion
By following these steps, you should now be able to create indexes and index patterns in OpenSearch. If you encounter any issues, refer back to the troubleshooting section or seek additional support.

End of Documentation
