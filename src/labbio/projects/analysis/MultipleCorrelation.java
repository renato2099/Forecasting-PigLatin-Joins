package labbio.projects.analysis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import labbio.projects.analysis.dataset.*;
import labbio.projects.analysis.dataset.Observation;;

/**
 * Class used to run MultiCorrelation Analysis
 * @author renatomarroquin
 */
public class MultipleCorrelation {
   
    public static HashMap<String, Object> goVariables = new HashMap<String, Object> ();
    public static ArrayList<String> goVarNames = new ArrayList<String>();
    public static DataSet goDataSet = new DataSet();
    /**
	 * The intercept for the linear regression model. Initialized following a
	 * call to init.
	 */
	private double intercept = 0.0;

	/**
	 * An mapping of variable names to coefficients for this multiple variable
	 * linear regression model. These are initialized following a call to init.
	 */
	private Hashtable coefficient;
    
	/**
	 * The maximum tolerance permitted when comparing two double precision
	 * numbers for equality. In other words, if two numbers are different
	 * by less than the value of TOLERANCE, then they are considered equal.
	 */
	static double TOLERANCE = 0.00000001;
	
//    public static void main(String[] args) {
//       
//        if (initialize()){
//            multipleCorrelation();
//            MultipleCorrelation obj = new MultipleCorrelation();
//            obj.init(goDataSet);
//            Observation loObs = new Observation(0.0);
//            loObs.setIndependentValue("Independent Variable1", 13.0);
//            loObs.setIndependentValue("Independent Variable2", 15.0);
//            loObs.setIndependentValue("Independent Variable3", 15.0);
//            
//            System.out.println(obj.printt());
//            System.out.println(obj.forecast(loObs));
//            
//            System.out.println("Execution Completed.");
//        }
//        else
//            System.out.println("Execution Incompleted.");
//    }
    
    /**
     * Method for configuring method variables' names
     * @param pVarNames
     */
	public void setVarNames(String pVarNames[]){
		for(String varName : pVarNames)
			goVarNames.add(varName);
	}
	
	/**
	 * Constructs the data set to be processed from the data passed
	 * @param pObsData		data to construct the dataSet
	 * @return objDataSet	the dataSet constructed
	 */
	public static DataSet constructDataSet(double[][] pObsData){
		
		DataSet objDataSet = new DataSet();
		// cols lenght should be the same as goVarNames - 1 
		// because the last one is the observation
		for (int cntRows = 0; cntRows < pObsData.length; cntRows++){
			
			Observation loObs = new Observation();
			
			for (int cntCols = 0; cntCols < pObsData[cntRows].length; cntCols++){
		        if (cntCols == pObsData[cntRows].length-1)
		        	loObs.setDependentValue(pObsData[cntRows][cntCols]);
		        else
		        	loObs.setIndependentValue(goVarNames.get(cntCols), pObsData[cntRows][cntCols]);
			}
			
			objDataSet.add(loObs);
		}
		
		return objDataSet;
	}
//    public static boolean initialize(){
//       
//        ArrayList<Double> loData = new ArrayList<Double>();
//       
//        // Independent Variable1
//        loData.add(12.0);
//        loData.add(14.0);
//        loData.add(15.0);
//        loData.add(16.0);
//        loData.add(18.0);
//        goVariables.put("Independent Variable1", loData);
//        goVarNames.add("Independent Variable1");
//       
//        //goVariables.put("Independent Variable1", mean(loData));
//        //goVariables.put("Independent Variable1", standDev(loData, false));
//       
//        loData = new ArrayList<Double>();
//       
//        loData.add(32.0);
//        loData.add(35.0);
//        loData.add(45.0);
//        loData.add(50.0);
//        loData.add(65.0);
//        goVariables.put("Independent Variable2", loData);
//        goVarNames.add("Independent Variable2");
//        //goVariables.put("Independent Variable2", mean(loData));
//        //goVariables.put("Independent Variable2", standDev(loData, false));
//       
//        loData = new ArrayList<Double>();
//       
//        loData.add(350000.0);
//        loData.add(399765.0);
//        loData.add(429000.0);
//        loData.add(435000.0);
//        loData.add(433000.0);
//        goVariables.put("Dependent Variable1", loData);
//        goVarNames.add("Dependent Variable1");
//        //goVariables.put("Dependent Variable1", mean(loData));
//        //goVariables.put("Dependent Variable1", standDev(loData, false));
//       
//        //System.out.println(mean(loData));
//        //System.out.println(standDev(loData, false));
//        //System.out.println(binaryCorrelation((ArrayList)goVariables.get("Independent Variable1"), (ArrayList)goVariables.get("Independent Variable2")));
//       
//        /*Observation loObs = new Observation(350000.0);
//        loObs.setIndependentValue("Independent Variable1", 12.0);
//        loObs.setIndependentValue("Independent Variable2", 32.0);
//        goDataSet.add(loObs);
//        
//        loObs = new Observation(399765.0);
//        loObs.setIndependentValue("Independent Variable1", 14.0);
//        loObs.setIndependentValue("Independent Variable2", 35.0);
//        goDataSet.add(loObs);
//        
//        loObs = new Observation(429000.0);
//        loObs.setIndependentValue("Independent Variable1", 15.0);
//        loObs.setIndependentValue("Independent Variable2", 45.0);
//        goDataSet.add(loObs);
//        
//        loObs = new Observation(435000.0);
//        loObs.setIndependentValue("Independent Variable1", 16.0);
//        loObs.setIndependentValue("Independent Variable2", 50.0);
//        goDataSet.add(loObs);
//        
//        loObs = new Observation(433000.0);
//        loObs.setIndependentValue("Independent Variable1", 18.0);
//        loObs.setIndependentValue("Independent Variable2", 65.0);
//        goDataSet.add(loObs);*/
//        Observation loObs = new Observation(13.0);
//        loObs.setIndependentValue("Independent Variable1", 15.0);
//        loObs.setIndependentValue("Independent Variable2", 15.0);
//        loObs.setIndependentValue("Independent Variable3", 13.0);
//        goDataSet.add(loObs);
//        
//        loObs = new Observation(13.0);
//        loObs.setIndependentValue("Independent Variable1", 14.0);
//        loObs.setIndependentValue("Independent Variable2", 13.0);
//        loObs.setIndependentValue("Independent Variable3", 12.0);
//        goDataSet.add(loObs);
//        
//        loObs = new Observation(13.0);
//        loObs.setIndependentValue("Independent Variable1", 16.0);
//        loObs.setIndependentValue("Independent Variable2", 13.0);
//        loObs.setIndependentValue("Independent Variable3", 14.0);
//        goDataSet.add(loObs);
//        
//        
//        loObs = new Observation(15.0);
//        loObs.setIndependentValue("Independent Variable1", 20.0);
//        loObs.setIndependentValue("Independent Variable2", 14.0);
//        loObs.setIndependentValue("Independent Variable3", 16.0);
//        goDataSet.add(loObs);
//        
//        loObs = new Observation(16.0);
//        loObs.setIndependentValue("Independent Variable1", 18.0);
//        loObs.setIndependentValue("Independent Variable2", 18.0);
//        loObs.setIndependentValue("Independent Variable3", 17.0);
//        goDataSet.add(loObs);
//        
//        loObs = new Observation(15.0);
//        loObs.setIndependentValue("Independent Variable1", 16.0);
//        loObs.setIndependentValue("Independent Variable2", 17.0);
//        loObs.setIndependentValue("Independent Variable3", 15.0);
//        goDataSet.add(loObs);
//        
//        //7
//        loObs = new Observation(12.0);
//        loObs.setIndependentValue("Independent Variable1", 13.0);
//        loObs.setIndependentValue("Independent Variable2", 15.0);
//        loObs.setIndependentValue("Independent Variable3", 11.0);
//        goDataSet.add(loObs);
//        
//        //8
//        loObs = new Observation(13.0);
//        loObs.setIndependentValue("Independent Variable1", 16.0);
//        loObs.setIndependentValue("Independent Variable2", 14.0);
//        loObs.setIndependentValue("Independent Variable3", 15.0);
//        goDataSet.add(loObs);
//        
//        //9
//        loObs = new Observation(13.0);
//        loObs.setIndependentValue("Independent Variable1", 15.0);
//        loObs.setIndependentValue("Independent Variable2", 14.0);
//        loObs.setIndependentValue("Independent Variable3", 13.0);
//        goDataSet.add(loObs);
//        
//        //10
//        loObs = new Observation(13.0);
//        loObs.setIndependentValue("Independent Variable1", 14.0);
//        loObs.setIndependentValue("Independent Variable2", 13.0);
//        loObs.setIndependentValue("Independent Variable3", 10.0);
//        goDataSet.add(loObs);
//        
//        //11
//        loObs = new Observation(11.0);
//        loObs.setIndependentValue("Independent Variable1", 12.0);
//        loObs.setIndependentValue("Independent Variable2", 12.0);
//        loObs.setIndependentValue("Independent Variable3", 10.0);
//        goDataSet.add(loObs);
//
//        //12
//        loObs = new Observation(14.0);
//        loObs.setIndependentValue("Independent Variable1", 16.0);
//        loObs.setIndependentValue("Independent Variable2", 11.0);
//        loObs.setIndependentValue("Independent Variable3", 14.0);
//        goDataSet.add(loObs);
//        
//        //13
//        loObs = new Observation(15.0);
//        loObs.setIndependentValue("Independent Variable1", 17.0);
//        loObs.setIndependentValue("Independent Variable2", 16.0);
//        loObs.setIndependentValue("Independent Variable3", 15.0);
//        goDataSet.add(loObs);
//        
//        //14
//        loObs = new Observation(15.0);
//        loObs.setIndependentValue("Independent Variable1", 19.0);
//        loObs.setIndependentValue("Independent Variable2", 14.0);
//        loObs.setIndependentValue("Independent Variable3", 16.0);
//        goDataSet.add(loObs);        
//        
//        //15
//        loObs = new Observation(15.0);
//        loObs.setIndependentValue("Independent Variable1", 13.0);
//        loObs.setIndependentValue("Independent Variable2", 15.0);
//        loObs.setIndependentValue("Independent Variable3", 10.0);
//        goDataSet.add(loObs);
//        
//        return true;
//    }
   
    /**
     * @param loData     ArrayList containing the data.
     * @return    The mean of the data.
     */
    protected static Double mean(ArrayList<Double> loData){
       
        if (loData != null && !loData.isEmpty()){
            double ldAcum = 0.0;
           
            for(Double ldElement : loData)
                ldAcum +=ldElement;
           
            return ldAcum/loData.size();
        }
       
        return 0.0;
    }
   
    /**
     * @param loData    ArrayList containing the data.
     * @param sdType    Standard Deviation type. Population or sample.
     * @return    The standard deviation of the data.
     */
    protected static Double standDev(ArrayList<Double> loData, boolean sdType){
       
        if (loData != null && !loData.isEmpty()){
       
            Double ldMean = mean(loData);
            Double ldAcum = 0.0;
           
            for(Double ldElement : loData)
                ldAcum += Math.pow(ldElement-ldMean,2);
           
            if(sdType)
                // POPULATION DISTRIBUTION
                return Math.sqrt((Double)(ldAcum/loData.size()));
            else
                // SAMPLE DISTRIBUTION
                return Math.sqrt(ldAcum/(loData.size()-1));

        }
       
        return 0.0;
    }

    /**
     * @param loData1    ArrayList containing the data for the first variable.
     * @param loData2    ArrayList containing the data for the second variable.
     * @return    Pearson���s Correlation Coefficient
     */
    protected static Double binaryCorrelation(ArrayList<Double> loData1, ArrayList<Double> loData2){
       
        if ((loData1 != null && !loData1.isEmpty())&&
            (loData2 != null && !loData2.isEmpty())){
           
            Double ldAcum1 = 0.0;
            Double ldAcum2 = 0.0;
            Double ldAcum3 = 0.0;
            Double ldMeanFstVar = mean(loData1);
            Double ldMeanSndVar = mean(loData2);
           
            // ASSUMING THAT ALL DATA VECTORS HAVE THE SAME SIZE
            for (int liCnt = 0; liCnt < loData1.size() ; liCnt++){
                ldAcum1 += (loData1.get(liCnt)-ldMeanFstVar)*(loData2.get(liCnt)-ldMeanSndVar);
                ldAcum2 += Math.pow((loData1.get(liCnt)-ldMeanFstVar),2);
                ldAcum3 += Math.pow((loData2.get(liCnt)-ldMeanSndVar),2);
            }
               
            return ldAcum1/(Math.sqrt(ldAcum2)*Math.sqrt(ldAcum3));
        }
       
        return 0.0;
       
    }

    protected static Double multipleCorrelation(){
       
        if (goVariables != null && !goVariables.isEmpty()){
           
            for (int liCnt1 = 0; liCnt1 < goVariables.size(); liCnt1++){
               
                for (int liCnt2 = liCnt1+1; liCnt2 < goVariables.size(); liCnt2++){
                    Double a = binaryCorrelation((ArrayList)goVariables.get(goVarNames.get(liCnt1)),(ArrayList)goVariables.get(goVarNames.get(liCnt2)));
                    System.out.println(a);
                }
               
            }
               
        }
        return 0.0;
    }
    
    public void init( DataSet dataSet )
	{
		String varNames[] = dataSet.getIndependentVariables();

		// If no coefficients have been defined for this model,
		//  use all that exist in this data set
		if ( coefficient == null )
			setIndependentVariables( varNames );

		int n = varNames.length;
		double a[][] = new double[n+1][n+2];

		// Iterate through dataSet
		Iterator it = dataSet.iterator();
		while ( it.hasNext() )
			{
				// Get next data point
				DataPoint dp = (DataPoint)it.next();

				// For each row in the matrix, a
				for ( int row=0; row<n+1; row++ )
					{
						double rowMult = 1.0;
						if ( row != 0 )
							{
								// Get value of independent variable, row
								String rowVarName = varNames[row-1];
								rowMult = dp.getIndependentValue(rowVarName);
							}

						// For each column in the matrix, a
						for ( int col=0; col<n+2; col++ )
							{
								double colMult = 1.0;
								if ( col == n+1 )
									{
										// Special case, for last column
										//  use value of dependent variable
										colMult = dp.getDependentValue();
									}
								else if ( col > 0 )
									{
										// Get value of independent variable, col
										String colVarName = varNames[col-1];
										colMult = dp.getIndependentValue(colVarName);
									}
								
								a[row][col] += rowMult * colMult;
							}
					}
			}

		// Solve equations to derive coefficients
		double coeff[] = GaussElimination(a);

		// Assign coefficients to independent variables
		intercept = coeff[0];
		for ( int i=1; i<n+1; i++ )
			coefficient.put( varNames[i-1], new Double(coeff[i]) );

		// Calculate the accuracy indicators
		calculateAccuracyIndicators( dataSet );
	}
    /**
	 * A helper method to calculate the various accuracy indicators when
	 * applying the given DataSet to the current forecasting model.
	 * @param dataSet the DataSet to use to evaluate this model, and to
	 *        calculate the accuracy indicators against.
	 */
	protected void calculateAccuracyIndicators( DataSet dataSet )
	{
		// Note that the model has been initialized
		//initialized = true;

		// Reset various helper summations
		double sumErr = 0.0;
		double sumAbsErr = 0.0;
		double sumAbsPercentErr = 0.0;
		double sumErrSquared = 0.0;

		// Obtain the forecast values for this model
		DataSet forecastValues = new DataSet( dataSet );
		forecast( forecastValues );

		// Calculate the Sum of the Absolute Errors
		Iterator it = dataSet.iterator();
		Iterator itForecast = forecastValues.iterator();
		while ( it.hasNext() )
			{
				// Get next data point
				DataPoint dp = (DataPoint)it.next();
				double x = dp.getDependentValue();

				// Get next forecast value
				DataPoint dpForecast = (DataPoint)itForecast.next();
				double forecastValue = dpForecast.getDependentValue();

				// Calculate error in forecast, and update sums appropriately
				double error = forecastValue - x;
				sumErr += error;
				sumAbsErr += Math.abs( error );
				sumAbsPercentErr += Math.abs( error / x );
				sumErrSquared += error*error;
			}

		// Initialize the accuracy indicators
		int n = dataSet.size();

		//accuracyIndicators.setBias( sumErr / n );
		System.out.println("sumErr / n " + sumErr / n);
		//accuracyIndicators.setMAD( sumAbsErr / n );
		System.out.println("sumAbsErr / n " + sumAbsErr / n);
		//accuracyIndicators.setMAPE( sumAbsPercentErr / n );
		System.out.println("sumAbsPercentErr / n " + sumAbsPercentErr / n);
		//accuracyIndicators.setMSE( sumErrSquared / n );
		System.out.println("sumErrSquared / n " + sumErrSquared / n);
		//accuracyIndicators.setSAE( sumAbsErr );
		System.out.println("sumAbsErr " + sumAbsErr);
	}
	
	
	
    /**
	 * A helper function that initializes the set of independent variables used
	 * in this model to the given array of independent variable names.
	 * @param independentVariable an array of independent variables to use in
	 *        this MultipleLinearRegressionModel.
	 */
	private void setIndependentVariables(String[] independentVariable)
	{
		// Create a new hashtable of just the right size
		coefficient = new Hashtable( independentVariable.length );
		
		// Add each independent variable with an initial coefficient of 0.0
		for ( int v=0; v<independentVariable.length; v++ )
			coefficient.put( independentVariable[v], new Double(0.0) );
	}
	
	/**
	 * Using the current model parameters (initialized in init), apply the
	 * forecast model to the given data set. Each data point in the data set
	 * must have valid values for the independent variables. Upon return, the
	 * value of the dependent variable will be updated with the forecast
	 * values computed.
	 *
	 * This method is provided as a convenience method, and iterates through the
	 * data set invoking forecast(DataPoint) to do the actual forecast for each
	 * data point. In general, it is not necessary to override this method.
	 * However, if a subclass can provide a more efficient approach then it is
	 * recommended that the subclass provide its own implementation.
	 * @param dataSet the set of data points for which forecast values (for
	 *        the dependent variable) are required.
	 * @return the same data set passed in but with the dependent values
	 *         updated to contain the new forecast values.
	 * @throws ModelNotInitializedException if getMSE is called before the
	 *         model has been initialized with a call to init.
	 */
	public DataSet forecast( DataSet dataSet )
	{

		Iterator it = dataSet.iterator();
		while ( it.hasNext() )
			{
				DataPoint dp = (DataPoint)it.next();
				dp.setDependentValue( forecast(dp) );
			}

		return dataSet;		
	}
	/**
	 * Returns a detailed description of this forcasting model, including the
	 * intercept and slope. A shortened version of this is provided by the
	 * getForecastType method.
	 * @return a description of this forecasting model.
	 */
	public String printt()
	{
		String desc = "Multiple variable linear regression model with the following equation:\n"
			+"  y="+intercept;

		Set coeffSet = coefficient.entrySet();
		Iterator it = coeffSet.iterator();
		while ( it.hasNext() )
			{
				Map.Entry entry = (Map.Entry)it.next();
				double coeff = ((Double)entry.getValue()).doubleValue();
				if ( coeff < -TOLERANCE )
					desc += coeff + "*" + entry.getKey();
				else if ( coeff > TOLERANCE )
					desc += "+" + coeff + "*" + entry.getKey();
				// else coeff == 0.0
			}

		return desc;
	}
	/**
	 * Using the current model parameters (initialized in init), apply the
	 * forecast model to the given data point. The data point must have valid
	 * values for the independent variables. Upon return, the value of the
	 * dependent variable will be updated with the forecast value computed for
	 * that data point.
	 * @param dataPoint the data point for which a forecast value (for the
	 *        dependent variable) is required.
	 * @return the forecast value of the dependent variable for the given data
	 *         point.
	 * @throws ModelNotInitializedException if forecast is called before the
	 *         model has been initialized with a call to init.
	 */
	public double forecast( DataPoint dataPoint )
	{
		double forecastValue = intercept;

		Iterator it = coefficient.entrySet().iterator();
		while ( it.hasNext() )
			{
				Map.Entry entry = (Map.Entry)it.next();

				// Get value of independent variable
				double x = dataPoint.getIndependentValue( (String)entry.getKey() );

				// Get coefficient for this variable
				double coeff = ((Double)entry.getValue()).doubleValue();
				forecastValue += coeff * x;
			}

		dataPoint.setDependentValue( forecastValue );

		return forecastValue;
	}
	/**
     * Implements a Gaussian elimination on the given matrix. The last column
     * being the Right Hand Side values. All rows in the matrix are used.
     * @param a the matrix to be solved.
     */
    static double[] GaussElimination( double a[][] )
    {
        int n = a.length;

        return GaussElimination( n, a );
    }
	/**
     * Implements a Gaussian elimination on the given matrix. The matrix
     * <code>a</code> should be n rows by n+1 columns. Column <code>n+1</code>
     * being the Right Hand Side values.
     * @param n the number of rows in the matrix.
     * @param a the matrix to be solved.
     */
    static double[] GaussElimination( int n, double a[][] )
    {
        // Forward elimination
        for ( int k=0; k<n-1; k++ )
            {
                for ( int i=k+1; i<n; i++ )
                    {
                        double qt = a[i][k] / a[k][k];
                        for ( int j=k+1; j<n+1; j++ )
                            a[i][j] -= qt * a[k][j];

                        a[i][k] = 0.0;
                    }
            }

        /*
        // DEBUG
        for ( int i=0; i<n; i++ )
            for ( int j=0; j<n+1; j++ )
                System.out.println( "After forward elimination, a["+i+"]["+j+"]="+a[i][j] );
        */

        double x[] = new double[n];

        // Back-substitution
        x[n-1] = a[n-1][n] / a[n-1][n-1];
        for ( int k=n-2; k>=0; k-- )
            {
                double sum = 0.0;
                for ( int j=k+1; j<n; j++ )
                    sum += a[k][j]*x[j];
                
                x[k] = ( a[k][n] - sum ) / a[k][k];
            }

        /*
        // DEBUG
        for ( int k=0; k<n; k++ )
            System.out.println( "After back-substitution, x["+k+"]="+x[k] );
        */

        return x;
    }
}