# Ozwell Public API Specification

## Philosophy

This public repository for Ozwell API is the canonical reference for the API, enabling both internal and external teams to build against a stable, well-documented contract.
The Ozwell API specification project is an open and reliable source of truth for all Ozwell API interactions. All types and endpoints are defined using [Zod](https://github.com/colinhacks/zod), ensuring type safety, clarity, and consistency. 

**Key principles:**
- **Single Source of Truth:** The Zod-based spec is the definitive reference for all Ozwell API interactions.
- **OpenAPI Generation:** Zod definitions generate OpenAPI/Swagger documentation for up-to-date, interactive docs.
- **Implementation Agnostic:** This spec is independent of any implementation. Private/internal implementations include this repository as a submodule.
- **OpenAI Compatibility:** The API is call-for-call compatible with OpenAI’s API, with additional endpoints for [IndexedCP](https://github.com/mieweb/IndexedCP) uploads and conversation management. It also supports multi-user contribitions to a shared conversation.
- **Canonical Testing Implementation:** A Fastify server stub provides a reference implementation for testing, returning hard-coded responses for all endpoints.
- **Extensible:** Enhanced features and new endpoints are added in a transparent, community-driven manner.

---

## Repository Structure

This repository is organized to provide a clear separation between the API specification, reference implementation, client libraries, and documentation. Below is an overview of each directory and its purpose:

```
/spec                # Zod type definitions and endpoint specs (the core API contract)
/reference-server    # Fastify server stub for reference/testing
/clients
  /typescript        # TypeScript client implementation
  /python            # Python client implementation
/docs                # Generated OpenAPI/Swagger docs and usage guides
/scripts             # Utility scripts (e.g., for codegen, validation)
/tests               # Shared test cases and fixtures
README.md
CONTRIBUTING.md
LICENSE
```

### Directory Details

- **/spec**  
  Contains all Zod type definitions and endpoint specifications. This directory serves as the single source of truth for the Ozwell API contract, ensuring consistency across all implementations.

- **/reference-server**  
  Provides a Fastify server stub that implements the API spec with hard-coded responses. This reference server allows developers to test their integrations against a predictable, canonical implementation.

- **/clients**  
  Houses official client libraries for interacting with the Ozwell API. Each supported language (e.g., TypeScript, Python) has its own subdirectory.

- **/docs**  
  Contains generated OpenAPI/Swagger documentation and additional usage guides to help developers understand and work with the API.

- **/scripts**  
  Includes utility scripts for tasks such as generating OpenAPI documentation from Zod definitions, running the reference server, or validating the API spec.

- **/tests**  
  Contains shared test cases and fixtures that can be used to validate both the API spec and the reference server implementation.

- **Top-level files**  
  Standard project files for onboarding, contribution, and licensing.

---

## To-Do List

### Core Specification
- [ ] Define all base types using Zod
- [ ] Implement endpoint definitions (call-for-call with OpenAI)
- [ ] Add indexedCP upload endpoints for reliable file delivery
- [ ] Add conversation management/sharing endpoints

### Documentation
- [ ] Set up OpenAPI generation from Zod
- [ ] Integrate Swagger UI for interactive docs
- [ ] Write usage examples for each endpoint

### Client Implementations
- [ ] TypeScript client: auto-generate types and API calls from spec
- [ ] Python client: mirror TypeScript client functionality

### Reference Testing Implementation
- [ ] Add Fastify server stub that returns hard-coded responses for all endpoints
- [ ] Document how to use the server stub for local testing and integration

### Repository Management
- [ ] Document contribution guidelines
- [ ] Add code of conduct

### Enhanced Features
- [ ] Document and implement enhanced features (to be discussed)
- [ ] Add support for additional authentication methods
- [ ] Expand API for advanced conversation analytics

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md?utm_source=bluehive&utm_medium=chat&utm_campaign=bluehive-ai) for guidelines.
