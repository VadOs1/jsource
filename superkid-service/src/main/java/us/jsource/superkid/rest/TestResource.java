package us.jsource.superkid.rest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestResource {

    @GetMapping("/test")
    public ResponseEntity<String> getTestData() {
        return new ResponseEntity<>("Test", HttpStatus.OK);
    }
}
