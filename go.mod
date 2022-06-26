module github.com/cuisongliu/dex-login

go 1.13

replace (
	github.com/googleapis/gnostic => github.com/googleapis/gnostic v0.0.0-20170729233727-0c5108395e2d
	k8s.io/api => k8s.io/api v0.17.2
	k8s.io/client-go => k8s.io/client-go v0.17.2
)

require (
	github.com/coreos/go-oidc/v3 v3.0.0
	github.com/imdario/mergo v0.3.12 // indirect
	github.com/spf13/cobra v1.1.3
	golang.org/x/oauth2 v0.0.0-20210313182246-cd4f82c27b84
	k8s.io/apimachinery v0.17.2
	k8s.io/client-go v0.17.2
	k8s.io/utils v0.0.0-20210305010621-2afb4311ab10 // indirect
)
