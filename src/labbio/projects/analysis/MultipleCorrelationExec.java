package labbio.projects.analysis;

import labbio.projects.analysis.dataset.*;

/**
 * Class used to run MultiCorrelation Analysis
 * @author renatomarroquin
 */
public class MultipleCorrelationExec {

	public static void main(String[] args) {
	       
        MultipleCorrelation obj = new MultipleCorrelation();
        obj.init(configureDataSet(obj));
                
        Observation loObs = new Observation(0.0);
//        loObs.setIndependentValue("IVar1", 13.0);
//        loObs.setIndependentValue("IVar2", 15.0);
//        loObs.setIndependentValue("IVar3", 15.0);
        
        loObs.setIndependentValue("IVar1", 13.0);
        loObs.setIndependentValue("IVar2", 15.0);
        loObs.setIndependentValue("IVar3", 15.0);
        loObs.setIndependentValue("IVar4", 15.0);
        loObs.setIndependentValue("IVar5", 15.0);    
        
        System.out.println(obj.printt());
        System.out.println(obj.forecast(loObs));
            
        System.out.println("Execution Completed.");

    }
   /**
    * Method to set variables' names and to construct the dataSet
    * @param pObj	multipleCorrelation object
    * @return		the multipleCorreation object configured
    */
    public static DataSet configureDataSet(MultipleCorrelation pObj){
        
    	String varNames[] = {"IVar1","IVar2","IVar3","IVar4","IVar5"};
    	pObj.setVarNames(varNames);
    	return MultipleCorrelation.constructDataSet(initToyProblem());
    }
    
    /**
     * Sets the toy problem to test the multiple correlation method
     * @return test data, last column is the observed value
     */
    public static double[][] initToyProblem(){
 	   double data[][] = {
 			   { 7.0, 2.96471909E8, 1441848.0, 42.0},
 			  { 2.0, 2.1378956E7, 144072.0, 16.5},
 			  { 2.0, 4.5919377E7, 387514.0, 22.5},
 			  { 2.0, 2.643027E7, 162067.0, 21.0},
 			  { 4.0, 1.47148591E8, 719414.0, 22.5},
 			  { 2.0, 2.6486151E7, 230467.0, 22.5},
 			  { 2.0, 5502750.0, 50005.0, 18.0},
 			  { 2.0, 5502750.0, 50005.0, 16.5},
 			  { 2.0, 3.7761904E7, 305514.0, 23.0},
 			 {  5.0, 2.47130796E8, 1.1818049E7, 115.8},
 			   {2.0, 3.821217E7, 337514.0, 24.0},
 			  { 6.0, 3.17813047E8, 1585615.0, 45.0},
 			  { 2.0, 4.3027443E7, 360563.0, 22.5},
 			  { 2.0, 2.137971E7, 144102.0, 18.0},
 			  { 2.0, 3.1695809E7, 217116.0, 22.5},
 			  { 2.0, 2.6880536E7, 194067.0, 22.5},
 			  { 2.0, 2.1530024E7, 151267.0, 19.0}, 
 			  { 2.0, 3.2711344E7, 287549.0, 21.0}, 
 			  { 6.0, 3.09644048E8, 1541548.0, 43.5}, 
 			  { 4.0, 1.13501174E8, 2208314.0, 72.0}, 
 			  { 2.0, 3.271316E7, 287526.0, 22.5}, 
 			  { 2.0, 5502750.0, 50005.0, 16.5}, 
 			  { 6.0, 2.96586329E8, 1448748.0, 40.0}, 
 			  { 2.0, 3.2861658E7, 294714.0, 22.5}, 
 			  { 2.0, 2.1380262E7, 144073.0, 18.0}, 
 			  { 6.0, 3.01486575E8, 1459548.0, 104.0},
 			  { 7.0, 3.77225845E8, 3362348.0, 75.85714285714286},
 			  { 2.0, 5502750.0, 50005.0, 15.0},
 			  { 2.0, 5502750.0, 50005.0, 18.0},
 			  { 2.0, 3.4587743E7, 244067.0, 21.0},
 			  { 2.0, 2.3010163E7, 155785.0, 19.5},
 			  { 4.0, 1.47177053E8, 719684.0, 21.75},
 			  { 7.0, 3.94152673E8, 2898404.0, 118.28571428571428},
 			  { 6.0, 2.98066468E8, 1453266.0, 41.5},
 			  { 6.0, 2.96436567E8, 1441554.0, 35.0},
 			  { 2.0, 5502750.0, 50005.0, 18.0},
 			  { 6.0, 2.96435789E8, 1441568.0, 45.0},
 			  { 7.0, 4.21810779E8, 3167918.0, 64.07142857142857},
 			  { 7.0, 3.06752114E8, 1514597.0, 95.33333333333333},
 			  { 6.0, 2.96435261E8, 1441553.0, 36.5},
 			  { 2.0, 5089132.0, 18300.0, 16.5},
 			  { 3.0, 1.0216954E8, 2064867.0, 52.5},
 			  { 6.0, 3.17813047E8, 1585615.0, 55.833333333333336},
 			  { 6.0, 3.01936841E8, 1491548.0, 56.0},
 			  { 2.0, 2.1379484E7, 144087.0, 18.0}
 			   //{15.0, 15.0, 13.0, 13.0},
 			   //{14.0, 13.0, 12.0, 13.0},
 			   //{16.0, 13.0, 14.0, 13.0},
// 			   {18.0, 18.0, 17.0, 16.0},
// 			   {16.0, 17.0, 15.0, 15.0},
// 			   {13.0, 15.0, 11.0, 12.0},
// 			   {16.0, 14.0, 15.0, 13.0},
// 			   {15.0, 14.0, 13.0, 13.0},
// 			   {14.0, 13.0, 10.0, 13.0},
// 			   {12.0, 12.0, 10.0, 11.0},
// 			   {16.0, 11.0, 14.0, 14.0},
// 			   {17.0, 16.0, 15.0, 15.0},
// 			   {19.0, 14.0, 16.0, 15.0},
// 			   {13.0, 15.0, 10.0, 15.0}
 			   };
 	   return data;
    }
}
