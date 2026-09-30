# funding-service-cfs-releaseManagementSchema


## Overview

The Release Management Schema repository contains the database schema, SQL projects, and deployment artefacts used by the Calculate Funding Service (CFS) Release Management component.

The repository provides the source-controlled definition of database objects that support release lifecycle management, publishing processes, and funding release operations across the CFS platform.

## Purpose

This repository is responsible for:

- Maintaining Release Management database schemas.
- Version controlling database changes.
- Supporting automated deployment through CI/CD pipelines.
- Enabling consistent schema promotion across environments.
- Providing auditability and traceability of schema changes.

## Solution Context

Release Management is a key part of the Calculate Funding Service platform and supports:

- Funding release workflows
- Publishing operations
- Release tracking and status management
- Data relationships required for funding publication activities
- Reporting and operational support

This repository represents the authoritative source for Release Management database structures.

## Repository Structure

```text
/
├── CalculateFunding-ReleaseManagement/
│   ├── Tables/
│   ├── Views/
│   ├── Stored Procedures/
│   ├── Functions/
│   └── Security/
│
├── DevOps/
│
└── CalculateFunding-PublishedFundingSchema.sln
```

## Prerequisites

Before making changes ensure you have:

- Git
- Visual Studio with SQL Server Data Tools (SSDT)
- SQL Server or Azure SQL access where applicable
- Access to relevant Azure DevOps and GitHub repositories

## Building the Solution

Open the solution:

```text
CalculateFunding-PublishedFundingSchema.sln
```

Build the SQL project using Visual Studio or your preferred build pipeline.

## Deployment

Database deployments are performed through automated CI/CD pipelines.

Typical workflow:

1. Create a feature branch.
2. Implement schema changes.
3. Build and validate locally.
4. Raise a Pull Request.
5. Obtain approval from reviewers.
6. Merge to the target branch.
7. Pipeline deploys schema changes to the appropriate environment.

## Development Standards

### Schema Changes

When introducing schema updates:

- Minimise breaking changes.
- Ensure backward compatibility where possible.
- Include migration scripts when required.
- Validate deployments in non-production environments first.

### Naming Conventions

- Use meaningful and descriptive object names.
- Follow existing CFS database standards.
- Maintain consistency across schemas and database objects.

## Testing

Before submitting changes:

- Verify project builds successfully.
- Validate schema deployment.
- Review impacts on existing integrations.
- Confirm no unintended object changes are generated.

## Branch Strategy

### Main Branch

Contains production-ready schema definitions.

### Feature Branches

Used for development work:

```text
feature/<work-item-number>-description
```

### Hotfix Branches

Used for urgent production fixes:

```text
hotfix/<description>
```

## Pull Requests

When raising a Pull Request:

- Provide a clear business justification.
- Reference relevant work items.
- Include deployment considerations.
- Ensure pipeline validation succeeds.

## Security

Do not commit:

- Secrets
- Connection strings
- Credentials
- Environment-specific configuration

## Support

For repository support, contact the Calculate Funding Service team or raise an issue within the repository.

## Related Repositories

- Calculate Funding Service
- Published Funding Schema
- Funding Data Zone
- Release Management Services
- Infrastructure as Code repositories

## License

This repository is intended for internal use within the Department for Education (DfE).
