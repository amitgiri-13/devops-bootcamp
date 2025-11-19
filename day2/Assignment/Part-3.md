# Task 3: Metrics Calculation

## Given Data
- Total deployments: 40
- Deployments causing incidents: 6
- Time from commit to production (average): 3 hours
- Incident details:
  - Incident 1: Detected at 10:00 AM, resolved at 11:30 AM
  - Incident 2: Detected at 2:00 PM, resolved at 2:45 PM
  - Incident 3: Detected at 9:00 AM, resolved at 11:00 AM
  - Incident 4: Detected at 4:00 PM, resolved at 8:00 PM
  - Incident 5: Detected at 1:00 PM, resolved at 1:30 PM
  - Incident 6: Detected at 11:00 AM, resolved at 3:00 PM
- Working days: 20

---

## 1. Deployment Frequency (per day)
Deployment Frequency = (Total deployments) / (Working days) = 40 / 20 = 2 deployments/days

---

## 2. Lead Time for Changes
Given as average **3 hours** from commit to production.

---

## 3. Change Failure Rate (%)
Change Failure Rate = ( Deployments causing incidents / Total deployments ) * 100 = 6 /40 * 100 = 15% 

---

## 4. Mean Time to Recovery (MTTR)
Calculation of resolution time for each incident:

| Incident | Detected | Resolved | Duration (hours) |
|----------|----------|----------|------------------|
| 1        | 10:00 AM | 11:30 AM | 1.5              |
| 2        | 2:00 PM  | 2:45 PM  | 0.75             |
| 3        | 9:00 AM  | 11:00 AM | 2                |
| 4        | 4:00 PM  | 8:00 PM  | 4                |
| 5        | 1:00 PM  | 1:30 PM  | 0.5              |
| 6        | 11:00 AM | 3:00 PM  | 4                |

Sum of durations = 1.5 + 0.75 + 2 + 4 + 0.5 + 4 = **12.75 hours**

MTTR = 12.75 / 6 = 2.125 hours

---

## 5. Team Classification Based on DORA Metrics

| Metric                  | Value          | Elite                | High                 | Medium               | Low                  |
|-------------------------|----------------|----------------------|----------------------|----------------------|----------------------|
| Deployment Frequency     | 2 per day      | Multiple per day      | Daily                | Between weekly/monthly| yearly or more    |
| Lead Time for Changes    | 3 hours       | <1 hour              | 1 day                | 1 week               | >1 month             |
| Change Failure Rate (%)  | 15%            | 0-15%                | 16-30%               | 31-45%               | >45%                 |
| MTTR                     | 2.125 hours    | <1 hour              | <1 day               | <1 week              | >1 week              |

---

### Interpretation

- **Deployment Frequency:** 2 per day → Between High and Elite  
- **Lead Time for Changes:** 3 hours → Closer to High  
- **Change Failure Rate:** 15% → At the border of Elite and High  
- **MTTR:** 2.125 hours → Closer to High  

---

### Overall Classification

The team is a **High performer**, close to Elite, based on the above DORA metrics.

---
