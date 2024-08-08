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
