# Continuous Interation and Continuous Delivery | Continuous Deployment

---

## CI

- Software Devlopment Practice
- Continuous Integration enables frequent merge of code changes
- Integrating code changes from multiple developers into a central repository frequently

### Cost

- Requires automated tests
- CI server is needed
- Developers need to merge more frequently

### Gain

- Less bugs as Automated Tests capture regressions.
- More effficient to build a release 
- Less context switching
- Parallel Testing: CI servers can leverage autoscaling  
- QA can focus on significant improvements rather spending time testing

---

## CD

- Extension of CI practice
- Automatically deploy all code changes to differenct environment
- Automatedd release process 
- Release to production more frequently
- Avoid last-moment or post-production surprises

### Cost

- Strong CI foundation is needed.
- Deployments need to be fully automated 
- Complex mechanisms like Feature Flags, A/B Testing, 
  Percentage Rollout etc needs to be leveraged.

### Gain

- No complexity needed at all for deploying. Save time with instant releases.
- Release more frequently
- Less decision making leading to faster iterations.

----

## CI/CD/CD

- **Continuous Delivery** : Deployment to production is manual
- **Continuous Deployment** : Deployment to production is automated

---
