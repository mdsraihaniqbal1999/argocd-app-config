# GitOps & Argo CD Knowledge Assessment

This comprehensive quiz tests your understanding of GitOps principles and Argo CD implementation across three difficulty levels.

## Easy (Fundamental & Basic)
*These questions test basic understanding of what GitOps and Argo CD are.*

### Conceptual Questions
1. **Cruise Control Analogy**: In the "cruise control" analogy, what does the Git repository represent?

2. **GitOps Principles**: What are the four core principles of GitOps?

3. **Configuration Types**: What is the primary difference between declarative and imperative configuration?

### Terminology
4. **Argo CD Component**: What is the name of the Argo CD component that continuously compares the live state to the desired state?

5. **Local Cluster Tool**: What Kubernetes tool did we use in the guide to create a local cluster?

6. **Kustomization File**: What is the purpose of the kustomization.yaml file in our demo app?

### Basic Usage
7. **Manual Sync**: What single command can you use to trigger Argo CD to redeploy your application after a Git commit (if auto-sync is off)?

8. **Self Heal Policy**: What does the selfHeal policy do in an Argo CD Application?

### Setup
9. **Default Credentials**: What is the default username for accessing the Argo CD UI after a fresh install?

10. **Port Forwarding**: What command did we use to port-forward the Argo CD server to our local machine?

---

## Medium (Practical Implementation & Configuration)
*These questions test the ability to configure, use, and troubleshoot a basic Argo CD setup.*

### Architecture
11. **Repo Server Role**: What is the role of the argocd-repo-server pod?

12. **Redis Cache**: Why does Argo CD use a Redis cache?

### Patterns & Generators
13. **App of Apps Pattern**: What is the "App of Apps" pattern and how does it differ from a single Application?

### Sync Policy
14. **Automated vs Manual Sync**: What is the difference between syncPolicy.automated and manually clicking the "Sync" button in the UI?

### Project Structure
15. **Repository Separation**: Why is it a best practice to separate your application source code repository from your Kubernetes manifest (app config) repository?

### Troubleshooting
16. **Sync Issues**: You change the number of replicas in your deployment.yaml and push to Git, but Argo CD does not deploy the change. What are two possible reasons?

17. **OutOfSync Status**: An Application shows a status of OutOfSync. What does this mean?

### Configuration
18. **AppProject Security**: How does an AppProject provide a security boundary for teams in Argo CD?

19. **Prune Option**: In our demo, what does the prune option in the sync policy do?

### Demo Lab
20. **Demo Project Manifest**: In the hands-on guide, what was the purpose of the demo-project.yaml manifest?

---

## Advanced (Complex Patterns, Security, & Optimization)
*These questions test deeper architectural knowledge, security considerations, and best practices.*

### Security
21. **Admin Password**: Why is it critical to change the default admin password in a production environment?

22. **External Identity Provider**: How can you integrate Argo CD with an external identity provider (e.g., GitHub SSO) instead of using local users?

### Strategy & Architecture
23. **Manual Sync Strategy**: When would you choose to disable automated sync and require manual synchronization?

24. **Multi-Cluster Management**: How could you use Argo CD to manage deployments to multiple Kubernetes clusters from a single control plane?

### Best Practices
25. **Configuration Drift**: What is "configuration drift" and how does GitOps prevent it?

26. **Direct kubectl Usage**: Why should you avoid using kubectl edit or kubectl apply directly on resources managed by Argo CD?

### Ecosystem
27. **Argo Rollouts**: What is the specific use case for Argo Rollouts compared to the core Argo CD tool?

28. **Image Updater**: If you wanted to automatically update image tags in your Git repo, which tool in the Argo ecosystem would you use?

### Performance
29. **Application Controller Impact**: What impact could a very large number of Applications have on the Argo CD Application Controller?

### GitOps Flow
30. **Perfect GitOps Workflow**: In a perfect GitOps workflow, who or what is the only actor that should be making changes to the cluster state? How is this enforced?

---

## Additional Resources
- [Argo CD Official Documentation](https://argo-cd.readthedocs.io/)
- [GitOps Principles](https://opengitops.dev/)
- [Argo CD Getting Started Guide](https://argo-cd.readthedocs.io/en/stable/getting_started/)
- [Argo CD Best Practices](https://argo-cd.readthedocs.io/en/stable/user-guide/best_practices/)
