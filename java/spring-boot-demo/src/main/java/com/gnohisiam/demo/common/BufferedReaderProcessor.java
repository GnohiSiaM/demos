package com.gnohisiam.demo.common;

import java.io.BufferedReader;
import java.io.IOException;

@FunctionalInterface
public interface  BufferedReaderProcessor {

    String process(BufferedReader bufferedReader) throws IOException;

}