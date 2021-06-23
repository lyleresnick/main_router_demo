abstract class Result<Entity, Reason> {}

class SuccessResult<Entity, Reason> extends Result<Entity, Reason> {
    final Entity data;
    SuccessResult({required this.data});
}

class FailureResult<Entity, Reason> extends Result<Entity, Reason> {
    final int code;
    final String description;
    FailureResult({required this.code, required this.description});
}

class SemanticErrorResult<Entity, Reason> extends Result<Entity, Reason> {
    final Reason reason;
    SemanticErrorResult({required this.reason});
}


