# Reproduce Analysis

## Overview of the workloads

I use two workloads described in the paper -

### MEDEC (Medical Error Detection and Correction)

The MEDEC dataset contains 3,848 clinical notes (each averaging 147 words) with labeled medical errors across five categories. The task is to detect whether an error is present in each note, identify the sentence containing the error, and generate a corrected version. The initial pipeline is a single map that produces three outputs:  `error_flag`, `error_sentence`, and `corrected_sentence`. The metric is an average of the error-detection **F1 scores** and the **corrected sentence Jaccard similarities** with the reference corrections.

### BlackVault (Declassified Articles).

This dataset from contains 733 articles (each averaging 7,351 words) describing international paranormal events. The task is to classify each document’s event type and aggregate distinct location mentions across documents of the same type. The initial pipeline has two operators: a `map` that extracts an event type per article (e.g., UFO sighting), followed by a reduce that aggregates locations by type. The metric is average recall of distinct locations per event type, normalized by the maximum recall achieved across all methods in the paper section Sec. 5.1.1 (to get a score between 0 and 1).

## Run the Workloads

Follow the commands in `run.sh` to run for each workload and use MOAR to search for the pareto-optimal pipelines.

## Results

Here, the Pareto-Optimal (consider both accuracy and cost) pipelines with rewrite directives searched by the `MOAR` optimizer are down below.

### MEDEC

```json
{
    "accuracy": 0.48514974251752657,
    "cost": 0.0037946,
    "value": 0.4091060132136819,
    "config_t": "pareto_optimal/medec.yaml"
  }
```

### BlackVault

```json
{
  "accuracy": 7.18459091578394021,
  "cost": 0.0587192,
  "value": 1.8518518518518519,
  "config_path": "pareto_optimal/blackvault.yaml"
}
```

