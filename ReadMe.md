## 📊 Transaction Monitoring & Risk Scoring Framework

---

## 📌 Overview

This project implements a rule-based transaction monitoring and behavioural risk scoring framework using MySQL 8.

It simulates core components of an AML (Anti-Money Laundering) style monitoring system, including:

- Behavioural profiling
- Peer-based anomaly detection
- Time-based change analysis

These signals feed into an investigation prioritization layer, producing explainable, ranked risk outputs for operational use.

---

## 🏗️ Architecture

Raw Transaction Data
↓
Feature Engineering (sender_activity_profile)
↓
Peer-Based Risk Scoring (percentile ranking)
↓
Behavioural Change Detection (30-day vs 60-day baseline)
↓
Composite Risk Engine (sender_final_risk)
↓
Alerting & Investigation Queue


---

## ⚙️ Data Processing Framework

### 1. Behavioural Feature Layer

Aggregates transaction data into account-level behavioural metrics:

- Transaction frequency  
- Monetary throughput  
- Burst activity  
- Activity volatility  

---

### 2. Peer-Based Anomaly Scoring

Accounts are evaluated relative to peers using percentile ranking:

- Normalized transaction intensity  
- Value distribution insights  
- Volatility comparisons  

---

### 3. Behavioural Shift Detection

Detects behavioural changes using time-window comparisons:

- Last 30 days vs previous 30 days  
- Transaction growth and acceleration  
- Structural behaviour shifts  

---

### 4. Composite Risk Engine

Final risk score combines structural and temporal signals:

**Final Risk Score =**
- 60% Peer Risk  
- 40% Behavioural Shift Risk  

Outputs are normalized to a 0–100 scale.

---

## 🚨 Alerting & Triage

### Risk Classification

- **High Risk** → Structural anomaly + behavioural shift  
- **Medium Risk** → Persistent anomaly only  
- **Watchlist** → Behavioural deviation without sustained risk  

---

### Investigation Queue

- Ranked by risk score + behavioural volatility  
- Supports analyst prioritization workflows  

---

## 🧠 Design Principles

- Modular SQL pipeline (feature → scoring → decision layers)  
- Population-based (relative) risk modelling  
- Behavioural change sensitivity  
- Explainability-first design  
- Extensible and auditable architecture  

---

## 🛠️ Technology Stack

- MySQL 8  
- Window Functions (PERCENT_RANK)  
- Common Table Expressions (CTEs)  
- View-based pipeline design  

---

## 📊 Outputs

- Entity-level risk score (0–100)  
- Risk classification (High / Medium / Watchlist)  
- Behavioural shift indicators  
- Ranked investigation priority  

---

## 📁 Repository Structure

sql/
00_exploration/
01_schema/
02_feature_engineering/
03_risk_model/
04_behavior_analysis/
05_decision_layer/


---

## 📌 Summary

This project demonstrates an end-to-end SQL-based behavioural monitoring system that converts raw transactional data into explainable, prioritized risk signals.

It highlights:

- Modular design  
- Relative risk modelling  
- Behavioural change detection  
- Production-inspired analytical architecture  
