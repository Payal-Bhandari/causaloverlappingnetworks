# Integrating Overlapping Networks in Causal Learning

ION or Integrating overlapping networks is a way of integrating information about causal relationships that can be discovered from a collection of
datasets with related variables. This repository guides in understanding the workflow of ION Algortihm. 

## ION Algorithm

The main aim in ION is if datasets has overlapping variable with at least one other dataset, e.g. if two datasets D1 and D2, which measure variables V1 and V2, then we should be able to learn many of the causal relationships between the observed variables using this set of datasets.
<img width="630" alt="Screenshot 2023-02-06 at 7 02 27 AM" src="https://user-images.githubusercontent.com/51235238/217006757-928f7301-19fe-4883-9d94-09eea698e3b9.png">

To Implement the ION Algorithm we make use of the Answer Set Programming's Potassco Project called as Clingo. Clingo is used for describing the 
combinatorial problem of overlapping networks as a logic problem. The Clingo system takes the logic problem of networking as an input and computes the answer sets for the same. 

### Running of the Clingo Code

The Clingo code can be accessed from the file test1.lp 

#### Pseudo Code
```
PROGRAM FindOverlappingNetworks:
  edgesFromGrah1, ...
  edgesFromGraphN,
  notPresentEdgesFromGraph1,...
  notPresentEdgesFromGraphN,...
  nodesInGraph1,.....
  nodesInGraphN...
  // Checking Edges, Causal Connections, Directed edges...
END.
```
- Generate a RandomGraph as an Input
- Generate N number of subgraphs from the RandomGraph 
- Get the Information about:
  - Present Edges in the SubGraph
  - Absent Edges in the SubGraph
  - Nodes in the SubGraph
- From the Information obtained generate the Clingo Porgram input
  - `edges`,
  - `nedges`,
  - `bidirected edges`
  - `nodes`,
- Run the Clingo Program and obtain the answer sets.
- Answer set consists of: 
  - `edges`
- Convert the answer sets to the Graphs and then
- Validate the answer sets generated from the clingo output
  - Check for edges in RandomGraph,
- Analyze the different answer sets

## Example test cases

Some of the example test cases for the Clingo Code can be found in `test-case.txt` file

## Usage

The source code for Clingo Program and the python script is 

1) `conda create -n clng_env python=3.8 `
2) ` conda activate clng_env `
3) ` conda install -c potassco clingo` 
4) `clingo test1.lp -W no-atom-undefined --configuration=tweety -n 0 `

## New Input

Run the python script to create the new input
```
python ion.py
```
