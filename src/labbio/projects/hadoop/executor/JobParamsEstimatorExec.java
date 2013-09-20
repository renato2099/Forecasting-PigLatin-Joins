/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package labbio.projects.hadoop.executor;

import labbio.projects.hadoop.estimates.job.JobParamsEstimator;

/**
 * @author renatomarroquin
 */
public class JobParamsEstimatorExec {
	/**
	 * 1.9K		/mnt/tpcDS/data/call_center.dat
	 * 1.6M		/mnt/tpcDS/data/catalog_page.dat
	 * 283M		/mnt/tpcDS/data/catalog_sales.dat
	 * 9.9M		/mnt/tpcDS/data/date_dim.dat
	 * 
	 * 1891		/user/hadoop/pigData/call_center.dat
	 * 1631792	/user/hadoop/pigData/catalog_page.dat
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		//TODO change this into a test class
		//[true, /mnt/tpcDS/data/call_center.dat, /mnt/tpcDS/data/reason.dat]
		//false pigData/call_center.dat pigData/reason.dat
		String arg[] = new String[args.length -1];
		for (int iCnt = 0; iCnt < args.length-1; iCnt ++)
			arg[iCnt] = args[iCnt+1];
		JobParamsEstimator.initializer(args[0],arg);
		System.out.println("Block Size of the System " + JobParamsEstimator.getBlockSize() + " bytes");
		System.out.println("Total Input Bytes: "+ JobParamsEstimator.getTotalInputBytes());
		System.out.println("Approximate Number of Mappers: "+ JobParamsEstimator.estimateNumberOfMappers());
		System.out.println("Approximate Number of Reducers: "+ JobParamsEstimator.estimateNumberOfReducers());
		System.out.println("Approximate Number of Total Input Records: "+ JobParamsEstimator.getTotalInputRecords());
	}
}
