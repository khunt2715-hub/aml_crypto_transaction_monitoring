## 📊 **Transaction Monitoring \& Risk Scoring System (SQL-Based AML Prototype)**



### **Overview**



This project implements a rule-based transaction monitoring and behavioural risk scoring framework using SQL (MySQL 8).



It is designed to simulate core components of an AML-style monitoring system, including behavioural profiling, peer-based anomaly detection, and time-based change analysis, culminating in an investigation prioritisation layer.



The system transforms raw transaction data into an explainable, prioritised risk output suitable for operational review.



### **Objectives**



The system was designed to:



Establish baseline behavioural profiles for sending entities

Identify outliers through peer-relative comparisons

Detect abrupt changes in transactional behaviour over time

Produce a unified, explainable risk score (0–100)

Prioritise accounts for operational investigation



### **End-to-End Architecture**



Raw Transaction Data

&#x20;       ↓

Behavioural Feature Engineering

(sender\_activity\_profile)

&#x20;       ↓

Peer-Relative Risk Scoring

(percentile-based anomaly detection)

&#x20;       ↓

Behavioural Change Detection

(30-day vs 60-day comparison)

&#x20;       ↓

Composite Risk Engine

(sender\_final\_risk)

&#x20;       ↓

Operational Layer

(alert classification + investigation queue)





### **Data Processing Framework**



##### **1. Behavioural Feature Layer**



Transaction-level data is aggregated into account-level behavioural descriptors, capturing:



Transaction frequency

Monetary throughput

Burst activity characteristics

Volatility in daily activity



This layer defines the structural behavioural baseline for each entity.



##### **2. Peer-Based Anomaly Scoring**



Each account is evaluated relative to the broader population using percentile ranking.



This generates a normalised view of:



Transaction intensity

Value distribution

Burst patterns

Volatility profiles



The output is a relative risk score, independent of absolute thresholds.



##### **3. Behavioural Shift Detection**



A time-windowed comparison is applied to identify deviations in behaviour:



Recent period (last 30 days)

Historical baseline (previous 30 days)



Key metrics include:



Transaction growth rate

Volume acceleration

Structural shifts in activity patterns



This captures emerging or evolving risk signals not visible in static profiling.



##### **4. Composite Risk Engine**



The final risk score integrates both structural and temporal risk dimensions:



Final Risk Score =

60% Peer-Based Risk +

40% Behavioural Shift Risk



This ensures balanced weighting between:



Persistent anomalous behaviour (structural risk)

Emerging behavioural deviations (temporal risk)



The output is normalised to a 0–100 scale for operational interpretability.



##### **Alerting \& Triage Layer**



###### **Risk Classification**



Accounts are segmented into operational categories:



**HIGH RISK (Alert):** Elevated structural risk with concurrent behavioural shift

**MEDIUM RISK (Monitor):** High structural anomaly without recent change

**WATCHLIST:** Significant behavioural deviation without sustained risk profile



###### **Investigation Queue**



A prioritised queue is generated to support analyst workflows.



Accounts are ranked based on a composite priority score derived from both risk magnitude and behavioural volatility.



###### **Design Principles**



This framework is built on the following principles:



Separation of concerns across feature engineering, scoring, and decisioning layers

Relative risk modelling using population-based percentile distributions

Behavioural change sensitivity to capture emerging threats

Explainability-first design for operational interpretability

Modular SQL architecture to support extensibility and auditability





###### **Technology Stack**

MySQL 8

Window Functions (PERCENT\_RANK)

CTE-based transformations

View-based modular pipeline design



###### **Outputs**



The system produces an operational dataset containing:



Entity-level risk score (0–100)

Risk classification (High / Medium / Watch)

Behavioural shift indicators

Ranked investigation priority

###### 

###### **Use Cases**



This framework is applicable to:



Transaction monitoring in crypto or payments ecosystems

AML alert generation and triage systems

Fraud detection prototypes

Behavioural analytics and anomaly detection pipelines



###### **Repository Structure**

sql/

&#x20; 00\_exploration/

&#x20; 01\_schema/

&#x20; 02\_feature\_engineering/

&#x20; 03\_risk\_model/

&#x20; 04\_behavior\_analysis/

&#x20; 04\_decision\_layer/



docs/

&#x20; architecture.md

&#x20; scoring\_logic.md





##### **Summary**



This project demonstrates an end-to-end SQL-based behavioural monitoring framework that translates raw transactional data into explainable, prioritised risk signals.



It emphasises modular design, relative risk modelling, and behavioural change detection to simulate real-world AML monitoring logic in a lightweight analytical environment.





