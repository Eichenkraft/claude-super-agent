# Mission
Implement [feature name] that enables users to [primary capability/benefit].

# Context
[Why this feature is needed - user need, business requirement, integration requirement]

User Story:
As a [user type], I want to [action] so that [benefit].

Acceptance Criteria:
- [Criterion 1]
- [Criterion 2]
- [Criterion 3]

# Target Directory
[Absolute path where feature should be implemented]
Example: D:\CLAUDE SUPER AGENT\03_PROJECTS\ProjectName\features

# Tech Stack
- **Primary Language**: [Language and version]
- **Framework**: [If using a framework]
- **Libraries**: [External dependencies needed]
- **Database**: [If data persistence required]
- **API**: [External APIs or internal services]
- **Testing**: [Testing framework and tools]

# Entry Points
- **Main Implementation**: [Primary file/module]
- **Configuration**: [Config files if needed]
- **Tests**: [Test files location]
- **Documentation**: [Where to document]
- **Integration Points**: [Existing code that needs updates]

# Constraints
- **Backward Compatibility**: Must not break existing functionality
- **Performance**: [Performance requirements if any]
- **Security**: [Security considerations - authentication, authorization, data validation]
- **Error Handling**: Graceful failure with clear error messages
- **Logging**: Log important events and errors
- **Configuration**: Make behavior configurable where appropriate
- **Testing**: Minimum 80% code coverage for new code

# Implementation Plan
1. **Design**:
   - Define data structures/models
   - Design API/interface
   - Plan integration points with existing code

2. **Core Implementation**:
   - Implement main feature logic
   - Add input validation
   - Implement error handling
   - Add logging

3. **Integration**:
   - Integrate with existing systems
   - Update configuration
   - Add necessary migrations (if database)

4. **Testing**:
   - Write unit tests
   - Write integration tests
   - Test edge cases and error paths
   - Manual testing scenarios

5. **Documentation**:
   - Add inline code comments
   - Update README with usage examples
   - Update API documentation (if applicable)
   - Create user guide (if needed)

6. **Polish**:
   - Code review and cleanup
   - Performance optimization
   - Ensure code follows project conventions

# Success Criteria
- Feature works as described in acceptance criteria
- All tests pass (existing + new)
- Code coverage meets threshold (80%+)
- Performance meets requirements
- Documentation is complete and clear
- No security vulnerabilities introduced
- Code follows project style guide
- Integration doesn't break existing functionality

# Risks & Watchouts
- **Scope Creep**: Keep feature focused on core requirements
- **Integration Issues**: Carefully test with existing code
- **Performance**: Monitor impact on system performance
- **Security**: Validate all inputs, sanitize outputs
- **Error Cases**: Handle edge cases and failures gracefully
- **Dependencies**: Ensure all required libraries are compatible
- **Breaking Changes**: Avoid or clearly document API changes

---

## Implementation Checklist

Before marking feature complete:
- [ ] Core functionality implemented
- [ ] Input validation in place
- [ ] Error handling comprehensive
- [ ] Unit tests written and passing
- [ ] Integration tests written and passing
- [ ] Manual testing completed
- [ ] Code reviewed
- [ ] Documentation updated
- [ ] Performance tested
- [ ] Security reviewed
- [ ] CHANGELOG updated

## Testing Scenarios

Define specific test cases:
1. **Happy Path**: [Normal usage scenario]
2. **Edge Cases**: [Boundary conditions]
3. **Error Cases**: [Invalid inputs, system failures]
4. **Integration**: [Interaction with other components]
5. **Performance**: [Load testing if applicable]

## Documentation Needs

- Usage examples in README
- API documentation (if applicable)
- Configuration options
- Known limitations
- Migration guide (if breaking changes)
