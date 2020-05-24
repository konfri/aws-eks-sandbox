package com;

import lombok.Builder;
import lombok.NonNull;
import lombok.Value;

@Value
@Builder
public class Greeting {
    @NonNull
    String value;
}