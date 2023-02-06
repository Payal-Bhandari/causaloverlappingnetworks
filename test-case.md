# Test Cases
This file explains some test cases that were carried out for running of clingo algorithm 

## Test Case 1
### Pseudo Code
#### Input 
- G1: 1->2->3.
- G2: 1->4->3.
```
PROGRAM FindOverlappingNetworks:
  //Edges in the subgraphs 
  edge(1,2,1). edge(2,3,1). edge(1,4,2). edge(4,3,2).
  //Absent Edges in the subgraps
  nedge(1,3,1). nedge(3,1,1). nedge(3,1,2). nedge(1,3,2). 
  nedge(2,1,1). nedge(3,2,1). nedge(3,4,2). nedge(4,1,2).
  //Nodes in the subgraphs
  varin(1,1). varin(1,2). varin(1,3).
  varin(2,1). varin(2,4). varin(2,3).
END.
```
#### Output
- edge(4,2) edge(2,3) edge(1,4)
- edge(1,2) edge(4,3) edge(2,4)
<img width="400" alt="Screenshot 2023-02-06 at 7 28 27 AM" src="https://user-images.githubusercontent.com/51235238/217013191-7c65f59d-3979-4fc9-9b5d-d50561c92b76.png">


## Test Case 2
### Pseudo Code
#### Input 
- G1: 1->2->3.
- G2: 1->4->3.
- G3: 1->5->3.
<img width="336" alt="Screenshot 2023-02-06 at 7 34 16 AM" src="https://user-images.githubusercontent.com/51235238/217014975-2eb4c267-b38b-43e9-b286-8daad10c9eca.png">


```
PROGRAM FindOverlappingNetworks:
  //Edges in the subgraphs 
  edge(1,2,1). edge(2,3,1). edge(1,4,2). 
  edge(4,3,2). edge(1,5,3). edge(5,3,3).

  //Absent Edges in the subgraps
  nedge(1,3,1). nedge(3,1,1). nedge(3,1,2). 
  nedge(1,3,2). nedge(2,1,1). nedge(3,2,1).
  nedge(3,4,2). nedge(4,1,2). nedge(5,1,3).
  nedge(3,5,3). nedge(1,3,3). nedge(3,1,3).

  //Nodes in the subgraphs
  varin(1,1). varin(1,2). varin(1,3).
  varin(2,1). varin(2,4). varin(2,3).
  varin(3,1). varin(3,5). varin(3,3).

END.
```
#### Output
- edge(1,4) edge(4,5) edge(5,2) edge(2,3)
- edge(1,2) edge(2,5) edge(5,4) edge(4,3)
- edge(1,5) edge(5,2) edge(2,4) edge(4,3)
- edge(1,2) edge(2,4) edge(4,5) edge(5,3)
- edge(1,5) edge(5,4) edge(4,2) edge(2,3)
- edge(1,4) edge(4,2) edge(2,5) edge(5,3)
<img width="400" height = "350" alt="Screenshot 2023-02-06 at 7 34 28 AM" src="https://user-images.githubusercontent.com/51235238/217014984-6fbc726e-ddcf-4092-9ef1-cf875fb3fa54.png">

## Test Case 3 - A modification with bidirected egdes in the input
### Pseudo Code
#### Input 

<img width="400" alt="Screenshot 2023-02-06 at 7 59 34 AM" src="https://user-images.githubusercontent.com/51235238/217022807-36cdab72-470e-46ab-994b-bbd396b9814c.png">


```
PROGRAM FindOverlappingNetworks:
  //Edges in the subgraphs 
  edge (4, 6, 2) . edge (4, 7, 2) . edge (8, 7, 2) .
  edge (7, 9, 2) . edge (9, 10, 2) . edge (2, 1, 1) .
  edge (3, 2, 1) . edge (3, 4, 1) . edge (5, 3, 1) .
  //bidirected edges in the subgraph
  bidirected(1,4,2).
  //Absent Edges in the subgraps
  nedge (1, 3, 1) . nedge (1, 5, 1) . nedge (1, 4, 1) .
  nedge (4, 1, 1) . nedge (3, 1, 1) . nedge (5, 1, 1) .
  nedge (5, 2, 1) . nedge (5, 4, 1) . nedge (2, 5, 1) .
  nedge (4, 5, 1) . nedge (4, 2, 1) . nedge (2, 4, 1) . 
  nedge (1, 6, 2) . nedge (1, 7, 2) . nedge (1, 8, 2) .
  nedge (1, 9, 2) . nedge (1, 10, 2) . nedge (4, 8, 2) .
  nedge (4, 9, 2) . nedge (4, 10, 2) . nedge (7, 1, 2) .
  nedge (7, 6, 2) . nedge (7, 10, 2) . nedge (6, 1, 2) .
  nedge (6, 7, 2) . nedge (6, 8, 2) . nedge (6, 9, 2) .
  nedge (6, 10, 2) . nedge (8, 1, 2) . nedge (8, 6, 2) .
  nedge (8, 4, 2) . nedge (8, 9, 2) . nedge (8, 10, 2) .
  nedge (9, 1, 2) . nedge (9, 4, 2) . nedge (9, 6, 2) .
  nedge (9, 8, 2) . nedge (10, 1, 2) . nedge (10, 4, 2) .
  nedge (10, 6, 2) . nedge (10, 8, 2) .nedge (10, 7, 2) .
  //Nodes in the subgraphs
  varin (1, 1) . varin (1, 2) . varin (1, 3) .
  varin (1, 4) . varin (1, 5) . varin (2, 1) .
  varin (2, 4) . varin (2, 6) . varin (2, 7) .
  varin (2, 8) . varin (2, 9) . varin (2, 10) .
END.
```
#### Output
- edge(2,1) edge(3,2) edge(5,3) edge(3,4) edge(4,6) edge(4,7) edge(8,7) edge(7,9) edge(9,10)

<img width="500" alt="Screenshot 2023-02-06 at 8 04 42 AM" src="https://user-images.githubusercontent.com/51235238/217023908-be170ab1-2870-4f96-b2f7-6ace5679fc4d.png">
