## 📊 **Transaction Monitoring \& Risk Scoring Framework**



### **📌 Overview**



This project implements a rule-based transaction monitoring and behavioural risk scoring framework using MySQL 8.



It simulates core components of an AML (Anti-Money Laundering) system, including:



* Behavioural profiling
* Peer-based anomaly detection
* Time-based change analysis



These feed into an investigation prioritization layer, producing explainable, ranked risk outputs for operational use.





#### **🏗️ Architecture**



Raw Transaction Data

&#x20;       ↓

Feature Engineering (sender\_activity\_profile)

&#x20;       ↓

Peer-Base Risk Scoring (percentile-ranking)

&#x20;       ↓

Behavioural Change Detection (30-day vs 60-day)

&#x20;       ↓

Composite Risk Engine (sender\_final\_risk)

&#x20;       ↓

Alerting \& Investigation Queue





#### **⚙️ Data Processing Framework**





##### **1. Behavioural Feature Layer**

### 

Aggregates transaction data into account-level behavioural metrics:



* Transaction frequency
* Monetary throughput
* Burst activity
* Activity volatility



##### **2. Peer-Based Anomaly Scoring**



Accounts are evaluated relative to peers using percentile ranking, producing:



* Normalized transaction intensity
* Value distribution insights
* Volatility comparisons



##### **3. Behavioural Shift Detection**



Detects changes using time-window comparisons:



* Last 30 days vs previous 30 days
* Transaction growth and acceleration
* Structural behaviour shifts
* 

##### **4. Composite Risk Engine**



Final score combines structural and temporal signals:



Final Risk Score =

60% Peer Risk + 40% Behavioural Shift Risk



* Balances persistent vs emerging risk
* Normalised to 0–100 scale





##### **🚨 Alerting \& Triage**





###### **Risk Classification**



* **High Risk →** Structural anomaly + behavioural shift
* **Medium Risk →** Persistent anomaly only
* **Watchlist →** Behavioural deviation without sustained risk



###### **Investigation Queue**



* Ranked by risk score + behavioural volatility
* Supports analyst prioritization workflows





##### **🧠 Design Principles**





* Modular SQL pipeline (feature → scoring → decision layers)
* Population-based (relative) risk modelling
* Behavioural change sensitivity
* Explainability-first approach
* Extensible and auditable architecture



###### 

##### **🛠️ Technology Stack**





* MySQL 8
* Window Functions (PERCENT\_RANK)
* Common Table Expressions (CTEs)
* View-based pipeline design





##### **📊 Outputs**





* Entity-level risk score (0–100)
* Risk classification (High / Medium / Watchlist)
* Behavioural shift indicators
* Ranked investigation priority





##### **📁 Repository Structure**





sql/

&#x20; 00\_exploration/

&#x20; 01\_schema/

&#x20; 02\_feature\_engineering/

&#x20; 03\_risk\_model/

&#x20; 04\_behavior\_analysis/

&#x20; 04\_decision\_layer/





##### **📌 Summary**





This project demonstrates an **end-to-end SQL-based behavioural monitoring system** that converts raw transactional data into **explainable, prioritized risk signals**.



It highlights:



* Modular design
* Relative risk modelling
* Behavioural change detection



all within a lightweight, production-inspired analytical framework.

