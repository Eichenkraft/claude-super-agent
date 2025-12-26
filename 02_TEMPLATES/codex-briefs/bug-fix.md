# Mission
Fix bug where [description of unexpected behavior] occurs.

# Context
[Detailed description of the bug, when it was discovered, impact on users]

**Bug Report**:
- **Symptom**: [What users see/experience]
- **Expected Behavior**: [What should happen]
- **Actual Behavior**: [What currently happens]
- **Reproduction Steps**: [How to trigger the bug]
- **Frequency**: [Always/Sometimes/Rare]
- **Severity**: [Critical/High/Medium/Low]
- **Impact**: [Who is affected and how]

**Error Messages/Logs** (if available):
```
[Paste error messages or relevant log excerpts]
```

# Target Directory
[Absolute path to code containing the bug]
Example: D:\CLAUDE SUPER AGENT\03_PROJECTS\ProjectName\src

# Tech Stack
- **Language**: [Language and version]
- **Framework**: [If applicable]
- **Environment**: [Development/Staging/Production where bug occurs]
- **Dependencies**: [Relevant libraries]

# Entry Points
- **Buggy Code**: [File(s) likely containing the bug]
- **Related Code**: [Other files that may be involved]
- **Tests**: [Existing tests to update or new tests to add]
- **Configuration**: [Config that might be relevant]

# Constraints
- **CRITICAL**: Fix must not introduce new bugs (regression testing!)
- **Backward Compatibility**: Preserve existing API unless bug is in the API itself
- **Performance**: Don't degrade performance to fix the bug
- **Minimal Changes**: Fix should be as small and focused as possible
- **Testing**: Add test case that would have caught this bug
- **Documentation**: Update if bug was due to unclear documentation

# Implementation Plan
1. **Investigation**:
   - Reproduce the bug reliably
   - Analyze stack trace/logs
   - Identify root cause (not just symptoms!)
   - Check if bug affects other areas

2. **Design Fix**:
   - Plan the minimal fix that addresses root cause
   - Consider edge cases
   - Assess impact on related functionality

3. **Implement Fix**:
   - Make the code change
   - Add defensive checks if needed
   - Improve error messages

4. **Testing**:
   - Write test case that reproduces bug (should fail before fix)
   - Verify test passes after fix
   - Run all existing tests (regression check)
   - Test edge cases related to the fix
   - Manual testing in affected scenarios

5. **Verification**:
   - Verify fix in original bug scenario
   - Check for side effects
   - Ensure error messages are clear

6. **Documentation**:
   - Update CHANGELOG with bug fix entry
   - Update documentation if bug was due to unclear docs
   - Add code comments explaining the fix if complex

# Success Criteria
- Bug is no longer reproducible
- New test case prevents regression
- All existing tests still pass
- No new bugs introduced
- Performance not degraded
- Fix addresses root cause, not just symptoms
- Code is cleaner/clearer after fix
- CHANGELOG updated

# Risks & Watchouts
- **Symptom vs Root Cause**: Ensure you're fixing the cause, not just hiding symptoms
- **Regression**: The fix might break other functionality
- **Over-Engineering**: Don't refactor unrelated code while fixing bug
- **Incomplete Fix**: Bug might have multiple causes or manifest in other ways
- **Performance**: Some fixes might impact performance
- **Edge Cases**: Fix might work for common case but fail on edge cases

---

## Bug Fix Checklist

Before marking bug as fixed:
- [ ] Bug reliably reproduced
- [ ] Root cause identified
- [ ] Fix implemented
- [ ] Test case added (fails before fix, passes after)
- [ ] All existing tests pass
- [ ] Manual testing confirms fix
- [ ] No new bugs introduced
- [ ] No performance degradation
- [ ] CHANGELOG updated
- [ ] Documentation updated (if needed)

## Root Cause Analysis

Use "5 Whys" technique:
1. **Why did the bug occur?** [Answer]
2. **Why did that happen?** [Answer]
3. **Why did that happen?** [Answer]
4. **Why did that happen?** [Answer]
5. **Why did that happen?** [Root cause]

## Testing Strategy

1. **Reproduction Test**: [Exact steps that triggered bug]
2. **Fix Verification**: [Test that confirms fix works]
3. **Regression Tests**: [Related functionality to check]
4. **Edge Cases**: [Boundary conditions related to bug]

## Notes

- Add test case BEFORE fixing (TDD approach)
- Keep fix minimal and focused
- If bug reveals larger design issue, create separate refactoring task
- Consider if fix requires version bump (semantic versioning)
