package labbio.projects.hadoop.log.webparser;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;

import org.htmlparser.Node;
import org.htmlparser.NodeFactory;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.PrototypicalNodeFactory;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.http.ConnectionManager;
import org.htmlparser.http.ConnectionMonitor;
import org.htmlparser.http.HttpHeader;
import org.htmlparser.lexer.Lexer;
import org.htmlparser.lexer.Page;
import org.htmlparser.nodes.RemarkNode;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.util.DefaultParserFeedback;
import org.htmlparser.util.IteratorImpl;
import org.htmlparser.util.NodeIterator;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.util.ParserFeedback;
import org.htmlparser.visitors.NodeVisitor;

/**
 * Class used to scrap Hadoop statistics
 * @author renatomarroquin
 */
public class HadoopStatsScrapper implements Serializable {
    
	/**
	 * Scrapping Parameters 
	 */
	static public HashMap<String, HashMap> mParametersHashMap = new HashMap<String, HashMap>();
	
	/**
	 * Hash map where the results from each page will be stored.
	 */
	static protected ArrayList<String> mPageResults = new ArrayList<String>();
	
	/**
	 * Parameters' Names
	 */
	static protected ArrayList<String> mParamsNames = new ArrayList<String>();
	
    /**
     * Default job tracker web url
     */
    public static String DEFAULT_JOB_TRACKER = "http://localhost:50030/jobtracker.jsp";
    
    /**
     * Default job details web url
     */
    public static String DEFAULT_JOB_DETAILS = "http://localhost:50030/jobdetails.jsp?jobid=";
    
    /**
     * Default job tasks web url
     */
    public static String DEFAULT_JOB_TASKS = "http://localhost:50030/jobtasks.jsp?jobid=";
    
    public static String DEFAULT_COMPLETED_JOBS = "Completed Jobs";
    static protected ArrayList<String> mExecutedJobs = new ArrayList<String>();
    
    public static String DEFAULT_FAILED_JOBS = "Failed Jobs";
    protected static ArrayList<String> mFailedJobs = new ArrayList<String>();
    
    /**
	 * Serial version UID
	 */
	private static final long serialVersionUID = -3215884648236292354L;

	 /**
     * Feedback object.
     */
    protected ParserFeedback mFeedback;

    /**
     * The html lexer associated with this parser.
     */
    protected Lexer mLexer;
    
    /**
     * A quiet message sink.
     * Use this for no feedback.
     */
    public static final ParserFeedback DEVNULL =
        new DefaultParserFeedback (DefaultParserFeedback.QUIET);

    /**
     * A verbose message sink.
     * Use this for output on <code>System.out</code>.
     */
    public static final ParserFeedback STDOUT = new DefaultParserFeedback ();

    static
    {
        getConnectionManager ().getDefaultRequestProperties ().put (
            "User-Agent", "HTMLParser/");
    }

    //
    // Static methods
    //

    /**
     * initialize HashMap with parameters
     */
    public static void setTargetParams(String []pParams){
    	mParamsNames.addAll(Arrays.asList(pParams));
    }
    
    @Deprecated
    private static boolean isFailed(int iCnt){
    	int failedJobs[] = {92,181}; 
    	for(int iElem : failedJobs)
    		if(iCnt==iElem)
    			return true;
    	return false;
    }
    
    public static void setScrappingScope(){
    	
    	parseUrl(DEFAULT_JOB_TRACKER);
		setExecutedJobList();
		setFailedJobList();
		resetParseResults();

    }
    
    public static void resetParseResults(){
    	mPageResults.removeAll(mPageResults);
    }
    
    public static void parseUrl(String pUrl){
    	try {
    	   	Parser parser = new Parser();
			parser.setURL(pUrl);
			for (NodeIterator i = parser.elements (); i.hasMoreNodes (); )
				processMyNodes (i.nextNode ());
    	} catch (ParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public static void setExecutedJobList(){
    	
	    int posVal = mPageResults.lastIndexOf(DEFAULT_COMPLETED_JOBS);
	    if(posVal>0){
	    	String strJobId = "";
	    	posVal+=1;
	    	while((strJobId = mPageResults.get(posVal+=11)).contains("job_")){
	    		mExecutedJobs.add(strJobId);
	    	}
	    }
	    else
	    	System.out.println("Error getting completed jobs");
    	
    }
    
    public static void setFailedJobList(){

    	int posVal = mPageResults.lastIndexOf(DEFAULT_FAILED_JOBS);
    	if(posVal+11<mPageResults.size()){
    		String strJobId = "";
    		posVal+=1;
    		while((strJobId = mPageResults.get(posVal+=11)).contains("job_"))
    			mFailedJobs.add(strJobId);
    	}
    	else
    		System.out.println("Error getting failed jobs");

    }

    public static void scrapHadoopWeb(){
            
    	for(String jobId: mExecutedJobs){
    		
            String tmpJobDetailsUrl = DEFAULT_JOB_DETAILS;
            String tmpUrlTasks = DEFAULT_JOB_TASKS;
            String jobIdNumber = jobId.split("_")[2];
            
    		// MAPREDUCE FUNCTION STATS FOR SPECIFIC JOB
    		tmpUrlTasks = tmpUrlTasks.concat(jobId);
    		
    		//// FOR MAPPERS
    		String strCntMap = "&type=map&pagenum=1";
    		strCntMap = tmpUrlTasks.concat(strCntMap);
    		String taskId = "task_".concat(jobId.split("_")[1]+"_"+jobId.split("_")[2]);

    		parseUrl(strCntMap);
    		//System.out.println("Map Time " + jobId + ":"+ avgTime(loadTimes(taskId,true)));
    		double mapAvgTime = avgTime(loadTimes(taskId,true));
    		resetParseResults();//mPageResults.removeAll(mPageResults);
    		
    		
    		//// FOR REDUCERS
    		String strCntReduce = "&type=reduce&pagenum=1";
        	strCntReduce = tmpUrlTasks.concat(strCntReduce);
        	parseUrl(strCntReduce);
    		//System.out.println("Reduce Time " + jobId + ":"+ avgTime(loadTimes(taskId,false)));
    		double reduceAvgTime = avgTime(loadTimes(taskId,false));
    		resetParseResults();//mPageResults.removeAll(mPageResults);

    		// JOB STATS
    		tmpJobDetailsUrl = tmpJobDetailsUrl.concat(jobId);
    		parseUrl(tmpJobDetailsUrl);
    		loadResults(mapAvgTime,reduceAvgTime);
    		resetParseResults();//mPageResults.removeAll(mPageResults);
    		
    	}
    	
    }
    @Deprecated
    public static void scrapHadoopWeb(String pUrl, String pUrlTasks, String pId){
    	
        String tmpUrl = pUrl;
        String tmpUrlTasks = pUrlTasks;
        String tmpJobId = "job_".concat(pId);
        
        try
        {
        	Parser parser2 = new Parser();
        	for(int iCnt = 93; iCnt < 192; iCnt++){
        		
        	if(isFailed(iCnt)){
        		System.out.println("failed jobs.");
        	}
        	else{
        		
        		// creating the job id
        		tmpJobId = tmpJobId.concat(((iCnt<1000)?"0":""));
        		tmpJobId = tmpJobId.concat(((iCnt<100)?"0":""));	
        		tmpJobId = tmpJobId.concat(((iCnt<10)?"0":"")+String.valueOf(iCnt));
        		
        		// MAPREDUCE FUNCTION STATS FOR SPECIFIC JOB
        		tmpUrlTasks = tmpUrlTasks.concat(tmpJobId);
        		//// FOR MAPPERS
        		String strCntMap = "&type=map&pagenum=1";
        		strCntMap = tmpUrlTasks.concat(strCntMap);
        		String taskId = "task_".concat(pId);
        		parser2.setURL(strCntMap);
        		for (NodeIterator i = parser2.elements (); i.hasMoreNodes (); )
                	processMyNodes (i.nextNode ());
        		//System.out.println("Map Time " + jobId + ":"+ avgTime(loadTimes(taskId,true)));
        		double mapAvgTime = avgTime(loadTimes(taskId,true));
        		mPageResults.removeAll(mPageResults);
        		
        		
        		//// FOR REDUCERS
        		String strCntReduce = "&type=reduce&pagenum=1";
            	strCntReduce = tmpUrlTasks.concat(strCntReduce);
            	parser2.setURL(strCntReduce);
        		for (NodeIterator i = parser2.elements (); i.hasMoreNodes (); )
                	processMyNodes (i.nextNode ());
        		//System.out.println("Reduce Time " + jobId + ":"+ avgTime(loadTimes(taskId,false)));
        		double reduceAvgTime = avgTime(loadTimes(taskId,false));
        		mPageResults.removeAll(mPageResults);

        		// JOB STATS
        		tmpUrl = tmpUrl.concat(tmpJobId);
        		parser2.setURL(tmpUrl);
        		for (NodeIterator i = parser2.elements (); i.hasMoreNodes (); )
                	processMyNodes (i.nextNode ());
        		
        		loadResults(mapAvgTime,reduceAvgTime);
        		mPageResults.removeAll(mPageResults);
        		
        		tmpUrl = pUrl;
        		
        		tmpUrlTasks= pUrlTasks;
        		tmpJobId = "job_".concat(pId);
        		}//end if de failed jobs
        	}
        	
        }
        
        catch (Exception e)
        {
        	System.out.println(tmpUrl);
        	System.out.println(pUrl);
        	e.printStackTrace ();
        }
    }

    public static ArrayList<Double> loadTimes(String taskId, boolean flagMR){
    	ArrayList<Double> alTimes = new ArrayList<Double>();
    	
    	for (String strTask: mPageResults) {
    		
    		if (strTask.contains(taskId)){
    			int posVal = mPageResults.indexOf(strTask);
    			Long iniTime, finTime;
    			iniTime = (flagMR)?(new Date(mPageResults.get(posVal+2)).getTime()):(new Date(mPageResults.get(posVal+3)).getTime());
    			String strFinalTime = (flagMR)?mPageResults.get(posVal+3):mPageResults.get(posVal+4);
    			strFinalTime = strFinalTime.substring(0, strFinalTime.indexOf("(")-1);
    			finTime = (new Date(strFinalTime)).getTime();
    			alTimes.add((finTime-iniTime)/1000.0);
    		}
    	}
    	return alTimes;
    }
    
    public static double avgTime(ArrayList<Double> alTimes){
    	
    	double acum = 0.0;
    	
    	for(double value : alTimes)
    		acum += value;
    	
    	return (alTimes.size()!=0)?acum/alTimes.size():acum;
    	
    }
    
    /**
     * Method to load the map and reduce values into the mPageResults hash map
     * @param mapAvgTime
     * @param reduceAvgTime
     */
    public static void loadResults(double mapAvgTime,double reduceAvgTime){

    	ArrayList<Double> alMap = new ArrayList<Double>();
    	ArrayList<Double> alRed = new ArrayList<Double>();
    	
    	//TODO we would have to omit these two parameters
	    	int posVal = mPageResults.indexOf("Launched reduce tasks");
	    	String str = mPageResults.get(posVal+3);
	    	
	    	
	    	alMap.add(0.0);
	    	if(posVal > 0)
	    	   	alRed.add(Double.valueOf(str));
	    	else
	    		alRed.add(0.0);
	    	
	    	posVal = mPageResults.indexOf("Launched map tasks");
	    	str = mPageResults.get(posVal+3);
	    	alMap.add(Double.valueOf(str));
	    	alRed.add(0.0);
	    	
	    	for(String strParam: mParamsNames){
	    		if(!strParam.equals("Launched reduce tasks") && !strParam.equals("Launched map tasks") ){
		    		int posParam = mPageResults.indexOf(strParam);
		    		if(posParam != -1){
		    			alMap.add(Double.valueOf(removeChar(mPageResults.get(posParam+1),',')));
		    			alRed.add(Double.valueOf(removeChar(mPageResults.get(posParam+2),',')));
		    		}
		    		else{
		    			alMap.add(0.0);
			        	alRed.add(0.0);
		    		}
	        	}
	    	}
	    	// THE LAST ELEMENT IS THE AVG TIME
	    	alMap.add(mapAvgTime);
	    	alRed.add(reduceAvgTime);
	    	
	    	HashMap<String,ArrayList> hshMapRed = new HashMap<String,ArrayList>();
	    	hshMapRed.put("Map", alMap);
	    	hshMapRed.put("Reduce", alRed);
	    	
	    	posVal = mPageResults.indexOf("Job Name:");
	    	str = mPageResults.get(posVal+1);
	    	
	    	// check if there a second part of the job
	    	if(mParametersHashMap.containsKey(str))
	    		addJobValues(str,hshMapRed);
	    	else 
	    		mParametersHashMap.put(str, hshMapRed);

    }
    
    /**
     * Method to add the values to a single job in case there are two or more
     * depending on each other.
     * @param pKey
     * @param pHshMapRed
     */
    public static void addJobValues(String pKey, HashMap<String,ArrayList> pHshMapRed){
    	HashMap<String,ArrayList> hshMapRedOrig = mParametersHashMap.get(pKey);
    	
    	for(int iCnt=0; iCnt < hshMapRedOrig.get("Reduce").size(); iCnt++){
    		double sumValsRed = Double.valueOf(hshMapRedOrig.get("Reduce").get(iCnt).toString()) + Double.valueOf(pHshMapRed.get("Reduce").get(iCnt).toString());
    		double sumValsMap = Double.valueOf(hshMapRedOrig.get("Map").get(iCnt).toString()) + Double.valueOf(pHshMapRed.get("Map").get(iCnt).toString());
    		hshMapRedOrig.get("Reduce").remove(iCnt);
    		hshMapRedOrig.get("Map").remove(iCnt);
    		hshMapRedOrig.get("Reduce").add(iCnt, sumValsRed);
    		hshMapRedOrig.get("Map").add(iCnt, sumValsMap);
    	}
    	mParametersHashMap.put(pKey, hshMapRedOrig);
    }
    
    public static String removeChar(String s, char c) {

    	   String r = "";

    	   for (int i = 0; i < s.length(); i ++) {
    	      if (s.charAt(i) != c) r += s.charAt(i);
    	   }

    	   return r;
    	}
    

    
    static void processMyNodes (Node node) throws ParserException
    {
        if (node instanceof TextNode)
        {
            // downcast to TextNode
            TextNode text = (TextNode)node;
            // do whatever processing you want with the text
            String strTxt = text.getText ();
            strTxt = strTxt.replace('\n', ' ');
            strTxt = strTxt.trim();
            
            if ( !strTxt.isEmpty() ){
            	mPageResults.add(strTxt);
            	//System.out.println(strTxt);
            }
        }
        if (node instanceof RemarkNode)
        {
            // downcast to RemarkNode
            RemarkNode remark = (RemarkNode)node;
            // do whatever processing you want with the comment
        }
        else if (node instanceof TagNode)
        {
            // downcast to TagNode
            TagNode tag = (TagNode)node;
            // do whatever processing you want with the tag itself
            // ...
            // process recursively (nodes within nodes) via getChildren()
            NodeList nl = tag.getChildren ();
            if (null != nl)
                for (NodeIterator i = nl.elements (); i.hasMoreNodes(); )
                    processMyNodes (i.nextNode ());
        }
    }

    /**
     * Get the connection manager all Parsers use.
     * @return The connection manager.
     * @see #setConnectionManager
     */
    public static ConnectionManager getConnectionManager ()
    {
        return (Page.getConnectionManager ());
    }

    /**
     * Set the connection manager all Parsers use.
     * @param manager The new connection manager.
     * @see #getConnectionManager
     */
    public static void setConnectionManager (ConnectionManager manager)
    {
        Page.setConnectionManager (manager);
    }
    
    //
    // Constructors
    //

    /**
     * Zero argument constructor.
     * The parser is in a safe but useless state parsing an empty string.
     * Set the lexer or connection using {@link #setLexer}
     * or {@link #setConnection}.
     * @see #setLexer(Lexer)
     * @see #setConnection(URLConnection)
     */
    public HadoopStatsScrapper()
    {
        this(new Lexer(new Page("")), DEVNULL);
    }

    /**
     * Construct a parser using the provided lexer and feedback object.
     * This would be used to create a parser for special cases where the
     * normal creation of a lexer on a URLConnection needs to be customized.
     * @param lexer The lexer to draw characters from.
     * @param fb The object to use when information,
     * warning and error messages are produced. If <em>null</em> no feedback
     * is provided.
     */
    public HadoopStatsScrapper (Lexer lexer, ParserFeedback fb)
    {
        setFeedback (fb);
        setLexer (lexer);
        setNodeFactory (new PrototypicalNodeFactory ());
    }

    /**
     * Constructor for custom HTTP access.
     * This would be used to create a parser for a URLConnection that needs
     * a special setup or negotiation conditioning beyond what is available
     * from the {@link #getConnectionManager ConnectionManager}.
     * @param connection A fully conditioned connection. The connect()
     * method will be called so it need not be connected yet.
     * @param fb The object to use for message communication.
     * @throws ParserException If the creation of the underlying Lexer
     * cannot be performed.
     */
    public HadoopStatsScrapper(URLConnection connection, ParserFeedback fb)
        throws ParserException
    {
        this (new Lexer (connection), fb);
    }

    /**
     * Creates a Parser object with the location of the resource (URL or file)
     * You would typically create a DefaultHTMLParserFeedback object and pass
     * it in.
     * @see #Parser(URLConnection,ParserFeedback)
     * @param resource Either a URL, a filename or a string of HTML.
     * The string is considered HTML if the first non-whitespace character
     * is a &lt;. The use of a url or file is autodetected by first attempting
     * to open the resource as a URL, if that fails it is assumed to be a file
     * name.
     * A standard HTTP GET is performed to read the content of the URL.
     * @param feedback The HTMLParserFeedback object to use when information,
     * warning and error messages are produced. If <em>null</em> no feedback
     * is provided.
     * @throws ParserException If the URL is invalid.
     */
    public HadoopStatsScrapper (String resource, ParserFeedback feedback)
        throws ParserException
    {
        setFeedback (feedback);
        setResource (resource);
        setNodeFactory (new PrototypicalNodeFactory ());
    }

    /**
     * Creates a Parser object with the location of the resource (URL or file).
     * A DefaultHTMLParserFeedback object is used for feedback.
     * @param resource Either HTML, a URL or a filename (autodetects).
     * @throws ParserException If the resourceLocn argument does not resolve
     * to a valid page or file.
     * @see #Parser(String,ParserFeedback)
     */
    public HadoopStatsScrapper (String resource) throws ParserException
    {
        this (resource, STDOUT);
    }

    /**
     * Construct a parser using the provided lexer.
     * A feedback object printing to {@link #STDOUT System.out} is used.
     * This would be used to create a parser for special cases where the
     * normal creation of a lexer on a URLConnection needs to be customized.
     * @param lexer The lexer to draw characters from.
     */
    public HadoopStatsScrapper (Lexer lexer)
    {
        this (lexer, STDOUT);
    }

    /**
     * Construct a parser using the provided URLConnection.
     * This would be used to create a parser for a URLConnection that needs
     * a special setup or negotiation conditioning beyond what is available
     * from the {@link #getConnectionManager ConnectionManager}.
     * A feedback object printing to {@link #STDOUT System.out} is used.
     * @see #Parser(URLConnection,ParserFeedback)
     * @param connection A fully conditioned connection. The connect()
     * method will be called so it need not be connected yet.
     * @throws ParserException If the creation of the underlying Lexer
     * cannot be performed.
     */
    public HadoopStatsScrapper(URLConnection connection) throws ParserException
    {
        this (connection, STDOUT);
    }

    //
    // Bean patterns
    //

    /**
     * Set the html, a url, or a file.
     * @param resource The resource to use.
     * @exception IllegalArgumentException if <code>resource</code> is <code>null</code>.
     * @exception ParserException if a problem occurs in connecting.
     */
    public void setResource (String resource)
        throws
            ParserException
    {
        int length;
        boolean html;
        char ch;

        if (null == resource)
            throw new IllegalArgumentException ("resource cannot be null");
        length = resource.length ();
        html = false;
        for (int i = 0; i < length; i++)
        {
            ch = resource.charAt (i);
            if (!Character.isWhitespace (ch))
            {
                if ('<' == ch)
                    html = true;
                break;
            }
        }
        if (html)
            setLexer (new Lexer (new Page (resource)));
        else
            setLexer (new Lexer (getConnectionManager ().openConnection (resource)));
    }

    /**
     * Set the connection for this parser.
     * This method creates a new <code>Lexer</code> reading from the connection.
     * @param connection A fully conditioned connection. The connect()
     * method will be called so it need not be connected yet.
     * @exception ParserException if the character set specified in the
     * HTTP header is not supported, or an i/o exception occurs creating the
     * lexer.
     * @see #setLexer
     * @see #getConnection
     * @exception IllegalArgumentException if <code>connection</code> is <code>null</code>.
     * @exception ParserException if a problem occurs in connecting.
     */
    public void setConnection (URLConnection connection)
        throws
            ParserException
    {
        if (null == connection)
            throw new IllegalArgumentException ("connection cannot be null");
        setLexer (new Lexer (connection));
    }

    /**
     * Return the current connection.
     * @return The connection either created by the parser or passed into this
     * parser via {@link #setConnection}.
     * @see #setConnection(URLConnection)
     */
    public URLConnection getConnection ()
    {
        return (getLexer ().getPage ().getConnection ());
    }

    /**
     * Set the URL for this parser.
     * This method creates a new Lexer reading from the given URL.
     * Trying to set the url to null or an empty string is a no-op.
     * @param url The new URL for the parser.
     * @throws ParserException If the url is invalid or creation of the
     * underlying Lexer cannot be performed.
     * @exception ParserException if a problem occurs in connecting.
     * @see #getURL
     */
    public void setURL (String url)
        throws
            ParserException
    {
        if ((null != url) && !"".equals (url))
            setConnection (getConnectionManager ().openConnection (url));
    }

    /**
     * Return the current URL being parsed.
     * @return The current url. This is the URL for the current page.
     * A string passed into the constructor or set via setURL may be altered,
     * for example, a file name may be modified to be a URL.
     * @see Page#getUrl
     * @see #setURL
     */
    public String getURL ()
    {
        return (getLexer ().getPage ().getUrl ());
    }

    /**
     * Set the encoding for the page this parser is reading from.
     * @param encoding The new character set to use.
     * @throws ParserException If the encoding change causes characters that
     * have already been consumed to differ from the characters that would
     * have been seen had the new encoding been in force.
     * @see org.htmlparser.util.EncodingChangeException
     * @see #getEncoding
     */
    public void setEncoding (String encoding)
        throws
            ParserException
    {
        getLexer ().getPage ().setEncoding (encoding);
    }

    /**
     * Get the encoding for the page this parser is reading from.
     * This item is set from the HTTP header but may be overridden by meta
     * tags in the head, so this may change after the head has been parsed.
     * @return The encoding currently in force.
     * @see #setEncoding
     */
    public String getEncoding ()
    {
        return (getLexer ().getPage ().getEncoding ());
    }

    /**
     * Set the lexer for this parser.
     * The current NodeFactory is transferred to (set on) the given lexer,
     * since the lexer owns the node factory object.
     * It does not adjust the <code>feedback</code> object.
     * @param lexer The lexer object to use.
     * @see #setNodeFactory
     * @see #getLexer
     * @exception IllegalArgumentException if <code>lexer</code> is <code>null</code>.
     */
    public void setLexer (Lexer lexer)
    {
        NodeFactory factory;
        String type;

        if (null == lexer)
            throw new IllegalArgumentException ("lexer cannot be null");
        // move a node factory that's been set to the new lexer
        factory = null;
        if (null != getLexer ())
            factory = getLexer ().getNodeFactory ();
        if (null != factory)
            lexer.setNodeFactory (factory);
        mLexer = lexer;
        // warn about content that's not likely text
        type = mLexer.getPage ().getContentType ();
        if (type != null && !type.startsWith ("text"))
            getFeedback ().warning (
                "URL "
                + mLexer.getPage ().getUrl ()
                + " does not contain text");
    }

    /**
     * Returns the lexer associated with the parser.
     * @return The current lexer.
     * @see #setLexer
     */
    public Lexer getLexer ()
    {
        return (mLexer);
    }

    /**
     * Get the current node factory.
     * @return The current lexer's node factory.
     * @see #setNodeFactory
     */
    public NodeFactory getNodeFactory ()
    {
        return (getLexer ().getNodeFactory ());
    }

    /**
     * Set the current node factory.
     * @param factory The new node factory for the current lexer.
     * @see #getNodeFactory
     * @exception IllegalArgumentException if <code>factory</code> is <code>null</code>.
     */
    public void setNodeFactory (NodeFactory factory)
    {
        if (null == factory)
            throw new IllegalArgumentException ("node factory cannot be null");
        getLexer ().setNodeFactory (factory);
    }

    /**
     * Sets the feedback object used in scanning.
     * @param fb The new feedback object to use. If this is null a
     * {@link #DEVNULL silent feedback object} is used.
     * @see #getFeedback
     */
    public void setFeedback (ParserFeedback fb)
    {
        if (null == fb)
            mFeedback = DEVNULL;
        else
            mFeedback = fb;
    }

    /**
     * Returns the current feedback object.
     * @return The feedback object currently being used.
     * @see #setFeedback
     */
    public ParserFeedback getFeedback()
    {
        return (mFeedback);
    }


    /**
     * Returns an iterator (enumeration) over the html nodes.
     * {@link org.htmlparser.nodes Nodes} can be of three main types:
     * <ul>
     * <li>{@link org.htmlparser.nodes.TagNode TagNode}</li>
     * <li>{@link org.htmlparser.nodes.TextNode TextNode}</li>
     * <li>{@link org.htmlparser.nodes.RemarkNode RemarkNode}</li>
     * </ul>
     * In general, when parsing with an iterator or processing a NodeList,
     * you will need to use recursion. For example:
     * <code>
     * <pre>
     * void processMyNodes (Node node)
     * {
     *     if (node instanceof TextNode)
     *     {
     *         // downcast to TextNode
     *         TextNode text = (TextNode)node;
     *         // do whatever processing you want with the text
     *         System.out.println (text.getText ());
     *     }
     *     if (node instanceof RemarkNode)
     *     {
     *         // downcast to RemarkNode
     *         RemarkNode remark = (RemarkNode)node;
     *         // do whatever processing you want with the comment
     *     }
     *     else if (node instanceof TagNode)
     *     {
     *         // downcast to TagNode
     *         TagNode tag = (TagNode)node;
     *         // do whatever processing you want with the tag itself
     *         // ...
     *         // process recursively (nodes within nodes) via getChildren()
     *         NodeList nl = tag.getChildren ();
     *         if (null != nl)
     *             for (NodeIterator i = nl.elements (); i.hasMoreElements (); )
     *                 processMyNodes (i.nextNode ());
     *     }
     * }
     *
     * Parser parser = new Parser ("http://www.yahoo.com");
     * for (NodeIterator i = parser.elements (); i.hasMoreElements (); )
     *     processMyNodes (i.nextNode ());
     * </pre>
     * </code>
     * @throws ParserException If a parsing error occurs.
     * @return An iterator over the top level nodes (usually {@.html <html>}).
     */
    public NodeIterator elements () throws ParserException
    {
        return (new IteratorImpl (getLexer (), getFeedback ()));
    }
}
