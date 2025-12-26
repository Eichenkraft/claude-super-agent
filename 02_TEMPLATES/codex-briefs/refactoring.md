# Mission
Refactor [component/module/system] to improve [code quality/performance/maintainability].

# Context
[Why refactoring is needed - technical debt, performance issues, unclear code]

Current state:
- [Problem 1: Description]
- [Problem 2: Description]
- [Problem 3: Description]

Desired outcome:
- Improved code readability
- Better performance
- Easier maintenance
- [Other goals]

# Target Directory
[Absolute path to code being refactored]
Example: D:\CLAUDE SUPER AGENT\03_PROJECTS\ProjectName\src

# Tech Stack
- **Language**: [PowerShell/Python/TypeScript/etc.]
- **Framework**: [If applicable]
- **Version**: [Specific version constraints]
- **Testing Framework**: [For regression testing]

# Entry Points
- **Files to Refactor**: [List specific files]
  - file1.ps1 (~ X LOC)
  - file2.py (~ Y LOC)
  - [etc.]
- **Tests**: [Existing test files to update]
- **Documentation**: [Files that need updating]

# Constraints
- **CRITICAL**: Must maintain backward compatibility OR document breaking changes
- **Testing**: Must pass all existing tests (or update tests if API changes)
- **No Feature Additions**: Pure refactoring - no new functionality
- **Preserve Behavior**: Same inputs must produce same outputs
- **Version Control**: Use git to track changes incrementally
- **Code Style**: Follow [language] best practices and conventions

# Implementation Plan
1. **Preparation**:
   - Review existing code and tests
   - Identify refactoring targets
   - Create git feature branch: `refactor/[name]`

2. **Refactoring Steps** (do incrementally):
   - Extract methods/functions for clarity
   - Rename variables to be more descriptive
   - Remove code duplication (DRY principle)
   - Simplify complex conditionals
   - Improve error handling
   - Add type hints/annotations (if applicable)

3. **Testing**:
   - Run existing tests after each change
   - Add new tests for edge cases if found
   - Verify performance hasn't degraded

4. **Documentation**:
   - Update inline comments
   - Update README if API changed
   - Document any breaking changes

5. **Review**:
   - Code review checklist
   - Performance benchmarks (if applicable)

# Success Criteria
- All existing tests pass
- Code is more readable and maintainable
- No new bugs introduced (regression testing)
- Code follows language/project conventions
- Performance is same or better
- Documentation is updated
- Git commits are clean and incremental

# Risks & Watchouts
- **Breaking Changes**: Carefully test all public APIs
- **Performance Regression**: Benchmark before and after
- **Over-Engineering**: Don't make code more complex than needed
- **Scope Creep**: Resist adding new features during refactoring
- **Lost Functionality**: Ensure all edge cases still work
- **Dependencies**: Check if refactored code affects other modules

---

## Refactoring Checklist

Before marking complete, verify:
- [ ] All tests pass
- [ ] Code is simpler/clearer than before
- [ ] No performance regression
- [ ] Documentation updated
- [ ] Breaking changes documented (if any)
- [ ] Git history is clean
- [ ] Code review completed

## Notes

- Refactor in small, testable increments
- Commit frequently with descriptive messages
- If tests don't exist, consider adding them first
- Use automated tools (linters, formatters) where possible
