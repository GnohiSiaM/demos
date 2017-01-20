import UIKit

func findEdgeOnLeftSide(x: Int, _ y: Int) -> [[Int]]? {
    let sideCellX = x - 1
    let sideCellY = y
    if sideCellX >= 0 {
        let sideCell = map[sideCellY][sideCellX]
        guard sideCell == 0 else {
            return nil
        }
    }
    
    return [
        [x, y],
        [x, y + 1]
    ]
}

func findEdgeOnRightSide(x: Int, _ y: Int, _ maxX: Int) -> [[Int]]? {
    let sideCellX = x + 1
    let sideCellY = y
    if sideCellX < maxX {
        let sideCell = map[sideCellY][sideCellX]
        guard sideCell == 0 else {
            return nil
        }
    }
    
    return [
        [x + 1, y],
        [x + 1, y + 1]
    ]
}

func findEdgeOnTopSide(x: Int, _ y: Int) -> [[Int]]? {
    let sideCellX = x
    let sideCellY = y - 1
    if sideCellY >= 0 {
        let sideCell = map[sideCellY][sideCellX]
        guard sideCell == 0 else {
            return nil
        }
    }
    
    return [
        [x, y],
        [x + 1, y]
    ]
}

func findEdgeOnBottomSide(x: Int, _ y: Int, _ maxY: Int) -> [[Int]]? {
    let sideCellX = x
    let sideCellY = y + 1
    if sideCellY < maxY {
        let sideCell = map[sideCellY][sideCellX]
        guard sideCell == 0 else {
            return nil
        }
    }
    
    return [
        [x, y + 1],
        [x + 1, y + 1]
    ]
}

/**
 从 0，1 表示的 map 中找出 0 与 1 相邻的所有边。
 
 - parameter map: 每方格用 0 或 1 表示的二维数组。
 
 - returns: 由两个点坐标表示的边构成的三维数组。
 */
func findEdges(map: [[Int]]) -> [[[Int]]] {
    var edges = [[[Int]]]()
    for (y, row) in map.enumerate() {
        for (x, cell) in row.enumerate() {
            guard cell == 1 else {
                continue
            }
            
            if let leftEdge = findEdgeOnLeftSide(x, y) {
                edges.append(leftEdge)
            }
            
            if let rightEdge = findEdgeOnRightSide(x, y, row.count) {
                edges.append(rightEdge)
            }
            
            if let topEdge = findEdgeOnTopSide(x, y) {
                edges.append(topEdge)
            }
            
            if let bottomEdge = findEdgeOnBottomSide(x, y, map.count) {
                edges.append(bottomEdge)
            }
        }
    }
    
    return edges
}

/**
 递归得将边收尾相连，用点表示，直到起点与终点相同组成多边形。
 
 - parameter edges: 由两个点坐标表示的边构成的三维数组。
 - parameter line:  递归时临时存储已连接的点。
 
 - returns: 剩余未连接的边，以及已连接成的线。
 */
func connectEdgesToOneLine(var edges: [[[Int]]], var _ line: [[Int]] = []) -> (remainingEdges: [[[Int]]], connectedLine: [[Int]]) {
    if line == [] {
        let firstEdge = edges[0]
        line.append(firstEdge[0])
        line.append(firstEdge[1])
        edges.removeAtIndex(0)
    }
    
    let currentPoint = line[line.count - 1]
    guard line[0] != currentPoint else {
        return (edges, line)
    }
    
    var nextEdgeFound = false
    for (i, var edge) in edges.enumerate() {
        guard !nextEdgeFound else {
            break
        }
        
        for (j, point) in edge.enumerate() {
            guard point == currentPoint else {
                continue
            }
            
            edge.removeAtIndex(j)
            line.appendContentsOf(edge)
            
            edges.removeAtIndex(i)
            nextEdgeFound = true
            break
        }
    }
    
    return connectEdgesToOneLine(edges, line)
}

/**
 简化线的点数组表示，去除不必要的点。
 
 - parameter line:            要简化的线。
 - parameter index:           递归时临时保存索引。
 - parameter direction:       递归时临时保存方向。
 - parameter indexesToRemove: 递归时临时保存要删除的点索引。
 
 - returns: 简化后的线。
 */
func compactLine(var line: [[Int]], _ index: Int = 0, _ direction: String = "", var _ indexesToRemove: [Int] = []) -> [[Int]] {
    if index == line.count - 1 {
        for index in indexesToRemove.reverse() {
            line.removeAtIndex(index)
        }
        
        return line
    }
    
    let currentPoint = line[index]
    let nextPoint = line[index + 1]
    var currentDirection = ""
    if currentPoint[0] == nextPoint[0] {
        currentDirection = "x"
    } else if currentPoint[1] == nextPoint[1] {
        currentDirection = "y"
    }
    
    if currentDirection == direction && direction != "" {
        indexesToRemove.append(index)
    }
    
    return compactLine(line, index + 1, currentDirection, indexesToRemove)
}

/**
 连接边为线。
 
 - parameter edges: 由两个点坐标表示的边构成的三维数组。
 
 - returns: 连接成的线数组。
 */
func connectEdges(var edges: [[[Int]]]) -> [[[Int]]] {
    var lines = [[[Int]]]()
    while edges.count > 0 {
        let result = connectEdgesToOneLine(edges)
        edges = result.remainingEdges
        let line = compactLine(result.connectedLine)
        lines.append(line)
    }
    
    return lines
}

let map = [
    [0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 1, 1, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0]
]

var edges = findEdges(map)
var lines = connectEdges(edges)

for line in lines {
    print(line)
}
