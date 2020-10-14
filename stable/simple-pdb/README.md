# Simple PDB

This chart just installs a Pod Disruption Budget.

## Use case

If you need to add a PDB to an app installed by a third-party chart,
and you cannot (or don't want to) edit that chart, install the PDB with this chart.

You will need to ensure it goes into the same namespace so the PDB can find the pods.
