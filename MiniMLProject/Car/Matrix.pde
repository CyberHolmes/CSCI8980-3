//matrix library

public class Matrix {
  public int nRows, nCols;
  public float[][] matrix;
  
  public Matrix(int m, int n){
    this.nRows = m;
    this.nCols = n;
    this.matrix = new float[nRows][nCols];
  }
  
  void populate(float[][] arr){
    for (int i=0;i<nRows;i++){
      for (int j=0;j<nCols;j++){
        this.matrix[i][j]=arr[i][j];
      }
    }
  }
  
  void randomize(){
    for (int i=0; i<nRows; i++){
      for (int j=0; j<nCols; j++){
        matrix[i][j] = randomGaussian();
      }
    }
  }
  
  void pprint(){ //"pretty print" the matrix
    for (int i=0; i<nRows; i++){
      for (int j=0; j<nCols; j++){
        print(str(matrix[i][j]) + ", ");
      }
      println();
    }
  }
  
  Matrix dotm(Matrix b){
    Matrix rm= new Matrix(this.nRows, b.nCols);
    if (this.nCols != b.nRows){      
      println("Invalid matrix sizes");
      return rm;
    } else {      
      for (int i=0; i<this.nRows;i++){
        for (int j=0; j<b.nCols; j++){
          float sum=0;
          for (int k=0; k<this.nCols; k++){
            sum += this.matrix[i][k]*b.matrix[k][j];
          }
          rm.matrix[i][j]=sum;
        }
      }
      return rm;
    }    
  }
  
  void addm(Matrix b){
    for (int i=0; i<this.nRows;i++){
      for (int j=0; j<this.nCols; j++){
        this.matrix[i][j] += b.matrix[i][j];
      }
    }
  }
  
  void activate(){
    for (int i=0; i<this.nRows;i++){
      for (int j=0; j<this.nCols; j++){
        if (this.matrix[i][j]<0){
          this.matrix[i][j] *= 0.1;
        }
      }
    }
  }
  
  float[][] toArray(){
    float[][] arr = new float[nRows][nCols];
    for (int i=0; i<this.nRows;i++){
      for (int j=0; j<this.nCols; j++){
        arr[i][j] = this.matrix[i][j];
      }
    }
    return arr;
  } 
  
}

Matrix dotmul(Matrix a, Matrix b){
  Matrix rm= new Matrix(a.nRows, b.nCols);
  if (a.nCols != b.nRows){      
    println("Invalid matrix sizes");
    return rm;
  } else {      
    for (int i=0; i<a.nRows;i++){
      for (int j=0; j<b.nCols; j++){
        float sum=0;
        for (int k=0; k<a.nCols; k++){
          sum += a.matrix[i][k]*b.matrix[k][j];
        }
        rm.matrix[i][j]=sum;
      }
    }
    return rm;
  }    
}
