Here’s a **detailed explanation of each Kubernetes error**, along with **diagnostic steps and resolution tips**:

---

### **1. Pod in “Pending” State**

**Symptom:**
Pods remain in `Pending` status after deployment.

**Root Causes:**

* **Insufficient resources** on nodes (CPU/memory).
* **NodeSelector**, **Taints/Tolerations**, or **Affinity/Anti-Affinity rules** prevent scheduling.
* **PVC binding issues** if using persistent volumes.
* **No suitable node** available for pod scheduling.

**Diagnostic Steps:**

```bash
kubectl describe pod <pod-name>
```

Check for:

* `Events:` section for scheduling errors.
* Errors like `0/3 nodes are available: 3 Insufficient memory`.

**Resolution:**

* Increase node resources or cluster size.
* Adjust resource `requests` and `limits` in your pod spec.
* Review and correct `nodeSelector`, `tolerations`, or `affinity` rules.
* Ensure persistent volumes (if used) are correctly defined and available.

---

### **2. CrashLoopBackOff**

**Symptom:**
Pod restarts repeatedly; status is `CrashLoopBackOff`.

**Root Causes:**

* Application crashes on start due to internal error.
* Invalid/missing environment variables or configuration.
* Faulty `livenessProbe` causes premature restarts.
* Filesystem or volume mount issues.

**Diagnostic Steps:**

```bash
kubectl logs <pod-name> --previous
kubectl describe pod <pod-name>
```

Look for:

* Application error messages in logs.
* Events showing probe failures or exit code 1/137.

**Resolution:**

* Fix application code/config causing the crash.
* Validate any mounted secrets/configs are correct.
* Adjust `livenessProbe` and `readinessProbe` thresholds.
* Set `restartPolicy: Never` temporarily for debugging.

---

### **3. Node Not Ready**

**Symptom:**
One or more nodes show `NotReady` in `kubectl get nodes`.

**Root Causes:**

* Node-level service issues (e.g., kubelet, Docker/containerd).
* Network partition or loss of connectivity.
* Disk pressure or resource exhaustion.

**Diagnostic Steps:**

```bash
kubectl describe node <node-name>
```

Check:

* `Conditions:` for `OutOfDisk`, `MemoryPressure`, `NetworkUnavailable`, etc.
* kubelet logs:

```bash
journalctl -u kubelet
```

**Resolution:**

* Restart container runtime (`sudo systemctl restart docker` or `containerd`).
* Ensure `/var/lib/kubelet` has sufficient disk space.
* Check node security groups/firewall for connectivity to control plane.
* Reboot the node if necessary.

---

### **4. ImagePullBackOff**

**Symptom:**
Pods stuck with `ImagePullBackOff` or `ErrImagePull`.

**Root Causes:**

* Wrong image name or tag.
* Private registry without credentials.
* Network issue accessing the image registry.

**Diagnostic Steps:**

```bash
kubectl describe pod <pod-name>
```

Check:

* `Events:` section for authentication or DNS errors.

**Resolution:**

* Confirm image name and tag are correct.
* Test with `docker pull <image>` locally.
* For private registries:

  * Create secret:

    ```bash
    kubectl create secret docker-registry regcred \
      --docker-server=<registry-url> \
      --docker-username=<username> \
      --docker-password=<password> \
      --docker-email=<email>
    ```
  * Reference it in your pod spec:

    ```yaml
    imagePullSecrets:
    - name: regcred
    ```

---

### **5. Resource Quotas and Limits**

**Symptom:**
Pods fail to schedule or terminate due to resource quota violations.

**Root Causes:**

* Quotas exceeded in the namespace.
* Limits too strict, causing OOMKills or throttling.

**Diagnostic Steps:**

```bash
kubectl describe quota
kubectl top pod <pod-name> # View live usage (requires metrics-server)
```

**Resolution:**

* Review and adjust `requests` and `limits` in deployment YAML:

  ```yaml
  resources:
    requests:
      cpu: "250m"
      memory: "128Mi"
    limits:
      cpu: "500m"
      memory: "256Mi"
  ```
* Ensure namespace quotas allow requested resources.

---

### **6. DNS Resolution Issues**

**Symptom:**
Pods fail to resolve service names or external domains.

**Root Causes:**

* `kube-dns` or `CoreDNS` not working properly.
* Network policies blocking DNS traffic.
* Misconfigured `dnsPolicy`.

**Diagnostic Steps:**

1. Exec into a pod:

   ```bash
   kubectl exec -it <pod-name> -- /bin/sh
   nslookup google.com
   nslookup <service-name>
   cat /etc/resolv.conf
   ```

2. Check CoreDNS logs:

   ```bash
   kubectl logs -n kube-system -l k8s-app=kube-dns
   ```

**Resolution:**

* Restart DNS pods:

  ```bash
  kubectl rollout restart deployment coredns -n kube-system
  ```
* Ensure `dnsPolicy` is set to `ClusterFirst` in pod spec.
* Check NetworkPolicy or firewall rules allowing DNS (UDP 53).

---

If you'd like, I can help you build a **Kubernetes troubleshooting cheat sheet** or script to automate common checks for these.
