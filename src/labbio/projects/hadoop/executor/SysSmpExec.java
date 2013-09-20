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

import labbio.projects.hadoop.sampler.impl.SystematicSampler;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.util.ToolRunner;

/**
 * @author renatomarroquin
 */
public class SysSmpExec {
	
	public static void main(String[] args)  {
		// TODO Auto-generated method stub
		String[] arg0 = {"true"};
		try {
			
			// from a file of 2880404 lines a sampling of 0.01 resulted in 25047 samples
			// this error is due to the estimation of the record size. We always take the
			// first line as if all lines were the same, but they are not, maybe the first
			// one is the smallest one.
			
			SystematicSampler sSampler = new SystematicSampler(new Path("file:///mnt/tpcDS/data/store_sales.dat"), 0.01);
			int retCode = ToolRunner.run(sSampler,arg0);
			Object[] objSampled = sSampler.getSample();
			
			for(Object o : objSampled)
				System.out.println(o.toString());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
