# Performance Question Template

Use this template when consulting Gemini about performance optimization, bottlenecks, or efficiency improvements.

---

## Question

[State your performance concern clearly]

**Context:**
- **What's slow**: [Specific operation or workflow]
- **Current Performance**: [Actual metrics - seconds, operations/sec, etc.]
- **Target Performance**: [Desired metrics]
- **Environment**: [Hardware, OS, language/framework versions]
- **Scale**: [Data size, concurrent users, request rate]

**Performance Profile** (if available):
```
[Profiler output, timing measurements, bottleneck analysis]
```

**Relevant Code:**
```[language]
[Code section that's slow]
```

**Current Metrics:**
- Execution time: [X seconds]
- Memory usage: [Y MB]
- CPU usage: [Z%]
- [Other relevant metrics]

**Questions for Gemini:**
- What's causing the performance bottleneck?
- How can I optimize this?
- Are there better algorithms/data structures?
- What are the tradeoffs of different approaches?
- How does this scale with larger data?

---

## Example Performance Questions

### Example 1: Slow File Processing
```
My PowerShell script is taking too long to process large directories.

Context:
- Task: Find and process .log files recursively
- Current: ~5 minutes for 10,000 files
- Target: Under 1 minute
- Environment: PowerShell 7.4, Windows 11, SSD
- Scale: 10,000-50,000 files per directory

Current Code:
```powershell
$logFiles = Get-ChildItem -Path "D:\Logs" -Filter "*.log" -Recurse
foreach ($file in $logFiles) {
    $content = Get-Content $file.FullName
    $errors = $content | Select-String "ERROR"
    if ($errors.Count -gt 0) {
        Write-Output "$($file.Name): $($errors.Count) errors"
    }
}
```

Current Metrics:
- Execution time: ~300 seconds
- Memory usage: Spikes to 2GB
- CPU: Only ~25% utilized

What I've tried:
- Using -File instead of -Recurse then filtering: Slightly faster
- Processing in batches: Still slow
- Select-String with -SimpleMatch: Marginal improvement

Questions:
- Why is it so slow? Is it I/O bound or CPU bound?
- Should I use parallel processing?
- Is Get-Content the bottleneck?
- How can I reduce memory usage?
```

### Example 2: Database Query Performance
```
API endpoint is timing out due to slow database queries.

Context:
- Endpoint: GET /api/users/search
- Current: 8-12 seconds for complex searches
- Target: Under 2 seconds
- Environment: Node.js, PostgreSQL 15, 1M user records
- Scale: 50-100 concurrent requests during peak

Slow Query:
```sql
SELECT u.*, p.*, a.*
FROM users u
LEFT JOIN profiles p ON u.id = p.user_id
LEFT JOIN activity_logs a ON u.id = a.user_id
WHERE u.name LIKE '%search%'
   OR u.email LIKE '%search%'
   OR p.bio LIKE '%search%'
ORDER BY u.created_at DESC
LIMIT 50
```

Current Metrics:
- Query time: 8000ms average
- Rows scanned: 1,000,000+
- Index usage: Sequential scan (no indexes used)

What I've tried:
- Adding indexes on name and email: Helped but still slow
- Limiting search to exact matches: Too restrictive for users
- Pagination: Helps but doesn't solve core issue

Questions:
- Are the LIKE queries the problem?
- Should I use full-text search instead?
- How do I optimize JOINs for this query?
- Would caching help here?
```

### Example 3: Memory Leak
```
My long-running Node.js process keeps consuming more memory.

Context:
- Process: Background worker processing queue messages
- Current: Memory grows from 100MB to 2GB over 6 hours
- Target: Stable memory usage under 500MB
- Environment: Node.js 20, Docker container with 4GB limit
- Scale: Processes 1000 messages/hour

Memory Profile:
```
Initial: 100MB
After 1 hour: 400MB
After 3 hours: 1.2GB
After 6 hours: 2GB (approaching limit)
```

Relevant Code:
```javascript
const processQueue = async () => {
  while (true) {
    const messages = await queue.getMessages(100);
    const results = [];

    for (const msg of messages) {
      const result = await processMessage(msg);
      results.push(result);
    }

    await saveResults(results);
    // Loop continues...
  }
};
```

What I've tried:
- Manual garbage collection: gc() - temporary relief only
- Clearing arrays after processing: results = [] - still leaks
- Heap snapshots: Too many retentions but can't identify source

Questions:
- Where is the memory leak likely occurring?
- How do I properly release memory in this pattern?
- Should I restart process periodically as workaround?
- Are there better queue processing patterns?
```

---

## Tips for Performance Questions

**Include:**
- Actual measurements (not "it feels slow")
- Code that's causing the bottleneck
- Scale information (data size, concurrency)
- What you've already profiled/tried
- Hardware/environment constraints

**Good Questions:**
- "This takes X seconds, how can I get it to Y?"
- "What's the bottleneck in this code?"
- "Which algorithm is better for my use case?"
- "How does this scale with larger data?"

**Avoid:**
- Premature optimization without profiling
- Vague "make it faster" without specifics
- No measurements or benchmarks
- Asking to optimize code you haven't tested

**After Gemini's Response:**
- Benchmark the suggested changes
- Profile before and after
- Consider tradeoffs (complexity vs speed)
- Test with realistic data volumes

---

## Performance Optimization Checklist

Before optimizing:
- [ ] Measured current performance
- [ ] Identified bottleneck (profiled)
- [ ] Set specific performance target
- [ ] Considered if optimization is needed
- [ ] Checked for obvious issues (N+1, missing indexes)

After optimization:
- [ ] Benchmarked improvement
- [ ] Verified correctness still holds
- [ ] Tested with realistic data
- [ ] Documented why change was made
