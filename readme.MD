# Ingress Controller

#### Create an IAM OIDC provider

```
eksctl utils associate-iam-oidc-provider --region us-east-1 --cluster expense --approve
```

#### Download IAM policy

```
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.11.0/docs/install/iam_policy.json

```

#### Create an IAM policy using above file

```
aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://iam-policy.json
```

#### Create IAM service account

```
eksctl create iamserviceaccount --cluster=expense --namespace=kube-system --name=aws-load-balancer-controller --attach-policy-arn=arn:aws:iam::339712874850:policy/AWSLoadBalancerControllerIAMPolicy --override-existing-serviceaccounts --region us-east-1 --approve
```

#### Add the EKS chart repo to Helm

```
helm repo add eks https://aws.github.io/eks-charts
```

#### Install drivers

```
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=expense --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller
```

ref: [https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/deploy/installation/](https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/deploy/installation/)