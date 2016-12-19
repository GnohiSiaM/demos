package com.gnohisiam.demo;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import com.gnohisiam.demo.common.BufferedReaderProcessor;

public class TestException {

    public TestException() {
    }

    boolean test_A() throws Exception {
        boolean result = true;
        try {
            result = test_B();
        } catch (Exception e) {
            System.out.println("test_A: catch exception");
            result = false;
            throw e;
        } finally {
            System.out.println("test_A: finally; return value=" + result);
            return result;
        }
    }

    boolean test_B() throws Exception {
        boolean result = true;
        try {
            System.out.println(1 / 0);
            return true;
        } catch (Exception e) {
            System.out.println("test_B, catch exception");
            result = false;
            throw e;
        } finally {
            System.out.println("test_B: finally; return value=" + result);
            return result;
        }
    }

    public static void main(String[] args) {
        TestException testException = new TestException();
        try {
            testException.test_A();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            String string = processFile( "/var/log/syslog", br -> br.readLine() + br.readLine());
            System.out.println(string);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static String processFile(String fileName, BufferedReaderProcessor p) throws IOException {
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            return p.process(br);
        }
    }

}