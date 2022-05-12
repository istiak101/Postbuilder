subscription-manager remove --all
subscription-manager unregister
subscription-manager clean

subscription-manager register

subscription-manager refresh
subscription-manager attach --pool <pool_id>
